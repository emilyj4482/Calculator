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
    
    func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
    
    func addAction(_ title: String) {
        let buttonTapped = UIAction { _ in
            print("\(title) button tapped")
        }
        addAction(buttonTapped, for: .touchUpInside)
    }
    
    func addAction2(_ action : UIAction) {
        addAction(action, for: .touchUpInside)
    }
    
    func setButton(_ title: String) {
        setTitle(title, for: .normal)
        
        let buttonTapped = UIAction { [weak self] _ in
            if self?.mainVM.numbersTypedIn == "0" {
                self?.mainVM.numbersTypedIn = title
            } else {
                self?.mainVM.numbersTypedIn += title
            }
        }
            
        addAction(buttonTapped, for: .touchUpInside)
    }
    
    func setColor(_ color: UIColor) {
        backgroundColor = color
    }
}
