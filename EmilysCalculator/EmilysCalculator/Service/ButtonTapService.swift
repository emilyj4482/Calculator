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
    
    private var lastTappedButton: ButtonInfo?
    
    func buttonTapped(of buttonInfo: ButtonInfo) {
        switch buttonInfo.role {
        case .number:
            if textStack == "0" {
                replaceText(buttonInfo.name.title)
            } else {
                appendText(buttonInfo.name.title)
            }
            // TODO: 연산자 누른 후 0 2번 이상 tap 안되게 처리
        case .operation:
            if lastTappedButton?.role == .operation && buttonInfo.name != .subtract {
                replaceLastest(buttonInfo.name.title)
            } else if textStack == "0" && buttonInfo.name == .subtract {
                replaceText(buttonInfo.name.title)
            } else {
                appendText(buttonInfo.name.title)
            }
        case .completer:
            if buttonInfo.name == .clear {
                clearText()
            } else if lastTappedButton?.role == .operation {
                print("Nothing happens")
            } else {
                getResultText()
            }
        }
        lastTappedButton = buttonInfo
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
}
