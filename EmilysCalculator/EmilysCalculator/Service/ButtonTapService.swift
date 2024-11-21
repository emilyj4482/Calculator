//
//  ButtonTapService.swift
//  EmilysCalculator
//
//  Created by EMILY on 13/11/2024.
//

import Foundation
import Combine

protocol ButtonTapServiceType {
    var textPublisher: CurrentValueSubject<String, Never> { get set }
    func buttonTapped(of buttonInfo: ButtonInfo)
}

class ButtonTapService: ButtonTapServiceType {
    
    var textPublisher = CurrentValueSubject<String, Never>("0")
    
    private var buttonTapHistory: (ButtonInfo?, ButtonInfo?)
    
    func buttonTapped(of buttonInfo: ButtonInfo) {
        switch buttonInfo.role {
        case .number:
            if textPublisher.value == "Error" {
                print("Only AC button allowed")
            } else {
                numberButtonTapped(of: buttonInfo)
            }
        case .operation:
            if textPublisher.value == "Error" {
                print("Only AC button allowed")
            } else {
                operationButtonTapped(of: buttonInfo)
            }
        case .completer:
            completerButtonTapped(of: buttonInfo)
        }
    }
}

extension ButtonTapService {
    private func replaceText(_ text: String) {
        textPublisher.send(text)
    }
    
    private func appendText(_ text: String) {
        textPublisher.send(textPublisher.value + text)
    }
    
    private func clearText() {
        textPublisher.send("0")
    }
    
    private func getResultText() {
        let calculationService: CalculationServiceType = CalculationService()
        switch calculationService.calculate(textPublisher.value) {
        case .success(let result):
            textPublisher.send(String(result))
        case .failure(let error):
            print(error.localizedDescription)
            textPublisher.send("Error")
        }
    }
    
    private func replaceLastest(_ text: String) {
        var currentText = textPublisher.value
        currentText.removeLast()
        textPublisher.send(currentText + text)
    }
    
    private func replaceLastTwo(_ text: String) {
        var currentText = textPublisher.value
        currentText.removeLast(2)
        textPublisher.send(currentText + text)
    }
    
    private func updateButtonTapHistory(_ buttonInfo: ButtonInfo) {
        buttonTapHistory.0 = buttonTapHistory.1
        buttonTapHistory.1 = buttonInfo
    }
}

extension ButtonTapService {
    private func numberButtonTapped(of buttonInfo: ButtonInfo) {
        if textPublisher.value == "0" {
            replaceText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonTapHistory.0?.role == .operation && buttonTapHistory.1?.name == .zero {
            if buttonInfo.name == .zero {
                print("No double zero after operator.")
            } else {
                replaceLastest(buttonInfo.name.title)
                updateButtonTapHistory(buttonInfo)
            }
        } else {
            appendText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        }
    }
    
    private func operationButtonTapped(of buttonInfo: ButtonInfo) {
        if (buttonTapHistory.0?.name == .multiply || buttonTapHistory.0?.name == .divide) && buttonTapHistory.1?.name == .subtract {
            replaceLastTwo(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonTapHistory.1?.role == .operation && buttonInfo.name != .subtract {
            replaceLastest(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonInfo.name == .subtract && (textPublisher.value == "0" || buttonTapHistory.1?.name == .add) {
            replaceLastest(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonInfo.name == .subtract && buttonTapHistory.1?.name == .subtract {
            print("Preventing subtract spam")
        } else {
            appendText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        }
    }
    
    private func completerButtonTapped(of buttonInfo: ButtonInfo) {
        if buttonInfo.name == .clear {
            clearText()
            updateButtonTapHistory(buttonInfo)
        } else if buttonTapHistory.1?.role == .operation {
            print("Nothing happens until formula completed")
        } else {
            getResultText()
            updateButtonTapHistory(buttonInfo)
        }
    }
}
