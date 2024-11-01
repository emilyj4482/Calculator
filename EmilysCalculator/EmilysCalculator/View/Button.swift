//
//  Button.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit
import Combine


enum ConfigureButtonAs {
    case number, operation, modifier
}

class Button: UIButton {
    
    private var cancellables = Set<AnyCancellable>()
    
    let mainVM = MainViewModel.shared
    
    let isZero: CurrentValueSubject<Bool, Never> = .init(false)
    
    var configureButtonAs: ConfigureButtonAs?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        layout()
        setButtonSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        titleLabel?.font = .systemFont(ofSize: 40)
        
        setTitleColor(.white, for: .normal)
        setTitleColor(.lightGray, for: .highlighted)
    }
    
    private func setButtonSize() {
        // default button width = (screen.width - 16 * 2 - 8 * 3) / 4
        // zero button width = (screen.width - 16 * 2 - 8) / 2
        mainVM.screen
            .combineLatest(isZero)
            .sink { [weak self] screen, isZero in
                if isZero {
                    self?.widthAnchor.constraint(equalToConstant: (screen.width - 40) / 2).isActive = true
                } else {
                    self?.widthAnchor.constraint(equalToConstant: (screen.width - 56) / 4).isActive = true
                }
                self?.heightAnchor.constraint(equalToConstant: (screen.width - 56) / 4).isActive = true
                self?.layer.cornerRadius = (screen.width - 56) / 8
            }
            .store(in: &cancellables)
    }
    
    func setButton(_ input: String) {
        setTitle(input, for: .normal)
        
        let buttonTapped = UIAction { [weak self] _ in
            print("\(input) button tapped")
            if self?.mainVM.numbersTypedIn == "0" {
                self?.mainVM.numbersTypedIn = input
            } else {
                self?.mainVM.numbersTypedIn += input
            }
        }
        addAction(buttonTapped, for: .touchUpInside)
    }
    
    func configureAs(_ type: ConfigureButtonAs) {
        self.configureButtonAs = type
        
        switch type {
        case .number:
            self.setColor(.number)
        case .operation:
            self.setColor(.operator)
        case .modifier:
            self.setColor(.status)
        }
    }
    
    func setColor(_ color: UIColor) {
        backgroundColor = color
    }
}
