//
//  Button.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class Button: UIButton {
    
    private let buttonTapService = ButtonTapService.shared
    
    private let buttonInfo: ButtonInfo
    
    init(buttonInfo: ButtonInfo) {
        self.buttonInfo = buttonInfo
        super.init(frame: .zero)
        layout()
        setColor()
        setButton()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        layer.cornerRadius = 40
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 80),
            heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    private func setColor() {
        switch buttonInfo.role {
        case .number:
            backgroundColor = .numbersButtonColor
        case .operation:
            backgroundColor = .operatorButtonColor
        }
    }
    
    private func setButton() {
        switch buttonInfo.name.withImage {
        case true:
            setImage(buttonInfo.name.systemName)
        case false:
            setTitle(buttonInfo.name.title)
        }
    }
    
    private func addTarget() {
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}

extension Button {
    private func setTitle(_ title: String) {
        titleLabel?.font = .boldSystemFont(ofSize: 30)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        setTitleColor(.lightGray, for: .highlighted)
    }
    
    private func setImage(_ systemName: String) {
        tintColor = .white
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)
        setImage(UIImage(systemName: systemName, withConfiguration: imageConfig), for: .normal)
    }
}

extension Button {
    @objc func buttonTapped() {
        buttonTapService.buttonTapped(of: buttonInfo)
    }
}
