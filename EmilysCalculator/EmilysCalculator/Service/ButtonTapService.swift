//
//  ButtonTapService.swift
//  EmilysCalculator
//
//  Created by EMILY on 13/11/2024.
//

import Foundation

protocol ButtonTapServiceType {
    
}

class ButtonTapService: ButtonTapServiceType {
    
    static let shared = ButtonTapService()
    
    private init() {}
    
    @Published var textStack: String = "0"
    
    private var buttonTapHistory: (ButtonInfo?, ButtonInfo?)
    
    func buttonTapped(of buttonInfo: ButtonInfo) {
        switch buttonInfo.role {
        case .number:
            if textStack == "Error" {
                print("Only AC button allowed")
            } else {
                numberButtonTapped(of: buttonInfo)
            }
        case .operation:
            if textStack == "Error" {
                print("Only AC button allowed")
            } else {
                operationButtonTapped(of: buttonInfo)
            }
        case .completer:
            completerButtonTapped(of: buttonInfo)
        }
    }
    
    private func replaceText(_ text: String) {
        textStack = text
    }
    
    private func appendText(_ text: String) {
        textStack.append(text)
    }
    
    private func clearText() {
        textStack = "0"
    }
    
    private func getResultText() {
        let calculationService = CalculationService()
        switch calculationService.calculate(textStack) {
        case .success(let result):
            textStack = String(result)
        case .failure(let error):
            print(error.localizedDescription)
            textStack = "Error"
        }
    }
    
    private func replaceLastest(_ text: String) {
        textStack.removeLast()
        textStack.append(text)
    }
    
    private func replaceLastTwo(_ text: String) {
        textStack.removeLast(2)
        textStack.append(text)
    }
    
    private func updateButtonTapHistory(_ buttonInfo: ButtonInfo) {
        buttonTapHistory.0 = buttonTapHistory.1
        buttonTapHistory.1 = buttonInfo
        // print(buttonTapHistory)
    }
}

extension ButtonTapService {
    private func numberButtonTapped(of buttonInfo: ButtonInfo) {
        if textStack == "0" {
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
        } else if buttonInfo.name == .subtract && (textStack == "0" || buttonTapHistory.1?.name == .add) {
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
