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
            if textStack == "Error" {} else {
                numberButtonTapped(of: buttonInfo)
            }
        case .operation:
            if textStack == "Error" {} else {
                operationButtonTapped(of: buttonInfo)
                updateButtonTapHistory(buttonInfo)
            }
        case .completer:
            completerButtonTapped(of: buttonInfo)
            updateButtonTapHistory(buttonInfo)
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
    
    private func updateButtonTapHistory(_ buttonInfo: ButtonInfo) {
        buttonTapHistory.0 = buttonTapHistory.1
        buttonTapHistory.1 = buttonInfo
        print(buttonTapHistory)
    }
}

extension ButtonTapService {
    private func numberButtonTapped(of buttonInfo: ButtonInfo) {
        if textStack == "0" {
            replaceText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonTapHistory.0?.role == .operation && buttonTapHistory.1?.name == .zero && buttonInfo.name == .zero {
            print("No double zero after operator.")
        } else {
            appendText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        }
    }
    
    private func operationButtonTapped(of buttonInfo: ButtonInfo) {
        if buttonTapHistory.1?.role == .operation && buttonInfo.name != .subtract {
            replaceLastest(buttonInfo.name.title)
        } else if buttonInfo.name == .subtract && (textStack == "0" || buttonTapHistory.1?.name == .add) {
            replaceLastest(buttonInfo.name.title)
        } else {
            appendText(buttonInfo.name.title)
        }
        // TODO: *- 누른 다음에 *+로 바뀌는 게 아니라 +로 되게 하기
    }
    
    private func completerButtonTapped(of buttonInfo: ButtonInfo) {
        if buttonInfo.name == .clear {
            clearText()
        } else if buttonTapHistory.1?.role == .operation {
            print("Nothing happens")
        } else {
            getResultText()
        }
    }
}
