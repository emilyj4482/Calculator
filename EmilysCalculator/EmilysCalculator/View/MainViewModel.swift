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
