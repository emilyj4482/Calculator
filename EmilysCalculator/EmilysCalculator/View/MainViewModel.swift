//
//  MainViewModel.swift
//  EmilysCalculator
//
//  Created by EMILY on 22/11/2024.
//

import Foundation
import Combine

class MainViewModel {
    
    private var cancellables = Set<AnyCancellable>()
    
    let buttons: [ButtonInfo] = [
        .init(role: .number, name: .seven),
        .init(role: .number, name: .eight),
        .init(role: .number, name: .nine),
        .init(role: .operation, name: .add),
        
        .init(role: .number, name: .four),
        .init(role: .number, name: .five),
        .init(role: .number, name: .six),
        .init(role: .operation, name: .subtract),
        
        .init(role: .number, name: .one),
        .init(role: .number, name: .two),
        .init(role: .number, name: .three),
        .init(role: .operation, name: .multiply),
        
        .init(role: .completer, name: .clear),
        .init(role: .number, name: .zero),
        .init(role: .completer, name: .equal),
        .init(role: .operation, name: .divide)
    ]
    
    @Published var inputLabelText: String = "0"
    
    private let buttonTapService: ButtonTapServiceType
    
    init(buttonTapService: ButtonTapServiceType = ButtonTapService()) {
        self.buttonTapService = buttonTapService
        bind()
    }
    
    func send(_ buttonInfo: ButtonInfo) {
        buttonTapService.buttonTapped(of: buttonInfo)
    }
    
    private func bind() {
        buttonTapService.textPublisher
            .sink { [weak self] text in
                self?.inputLabelText = text
            }
            .store(in: &cancellables)
    }
}
