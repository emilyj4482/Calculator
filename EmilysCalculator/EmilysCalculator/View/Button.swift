//
//  Button.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit
import Combine

class Button: UIButton {
    
    private var cancellables = Set<AnyCancellable>()
    
    let mainVM = MainViewModel.shared
    
    let isZero: CurrentValueSubject<Bool, Never> = .init(false)
    
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
    
  // 임시로 살려놓은 코드이며, 추후 mainViewModel로 통합할것.
    func buttonAction(_ input: String) {
        setTitle(input, for: .normal)
        
        let buttonTapped = UIAction { [weak self] _ in
            print("\(input) button tapped")
            
            if input == "=" {
                let expression = NSExpression(format: self?.mainVM.numbersTypedIn.replacingOccurrences(of: "x", with: "*") ?? "Error")
                let result = expression.expressionValue(with: nil, context: nil) as? Int
                
                self?.mainVM.numbersTypedIn = result?.description ?? "Error"
            } else {
                self?.mainVM.numbersTypedIn.append(input)
            }
            
        }
        addAction(buttonTapped, for: .touchUpInside)
    }
    
    private func setColor(_ group: ButtonGroup) {
        switch group {
        case .number:
            backgroundColor = .number
        case .operation:
            backgroundColor = .operator
        case .modifier:
            backgroundColor = .modifier
        }
    }
    
    func setButton(_ buttonInfo: ButtonInfo) {
        setTitle(buttonInfo.name.title, for: .normal)
        setColor(buttonInfo.group)
        addAction(mainVM.buttonTapped(buttonInfo), for: .touchUpInside)
    }
}
