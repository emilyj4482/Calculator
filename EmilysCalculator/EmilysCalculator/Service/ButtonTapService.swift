//
//  ButtonTapService.swift
//  EmilysCalculator
//
//  Created by EMILY on 13/11/2024.
//

import Foundation

protocol ButtonTapServiceType {
    func buttonTapped(of buttonInfo: ButtonInfo)
}

class ButtonTapService: ButtonTapServiceType {
    
    private let vm = MainViewModel.shared
    
    private var tappedButtonTypes: [ButtonRole] = []
    
    
    func buttonTapped(of buttonInfo: ButtonInfo) {
        // tappedButtonTypes.append(buttonInfo.role)
        switch buttonInfo.name {
        case .clear:
            clearText()
        default:
            appendText(buttonInfo.name.title)
        }
        
    }
    
    private func appendText(_ text: String) {
        if vm.inputLabelText == "0" {
            vm.inputLabelText = text
        } else {
            vm.inputLabelText.append(text)
        }
    }
    
    private func clearText() {
        vm.inputLabelText = "0"
    }
}
