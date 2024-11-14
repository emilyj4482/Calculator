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
            // TODO: 연산자 누른 후 0 2번 이상 tap 안되게 처리
            appendText(buttonInfo.name.title)
        case .operation:
            if buttonInfo.name == .clear {
                clearText()
            } else if lastTappedButton == nil || lastTappedButton?.role == .operation {
                print("Nothing happens")
            } else if buttonInfo.name == .equal {
                getResultText()
            } else {
                appendText(buttonInfo.name.title)
            }
        }
        lastTappedButton = buttonInfo
    }
    
    private func appendText(_ text: String) {
        if textStack == "0" {
            textStack = text
        } else {
            textStack.append(text)
        }
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
}
