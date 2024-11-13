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
        tappedButtonTypes.append(buttonInfo.role)
        print(buttonInfo.name.title)
        vm.inputLabelText.append(buttonInfo.name.title)
    }
}
