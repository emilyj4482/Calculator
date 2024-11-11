//
//  Button.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class Button: UIButton {
    let buttonInfo: ButtonInfo
    
    init(buttonInfo: ButtonInfo) {
        self.buttonInfo = buttonInfo
        super.init(frame: .zero)
        layout()
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        frame.size.height = 80
        frame.size.width = 80
        layer.cornerRadius = 40
        
        setColor()
    }
    
    private func setButton() {
        switch buttonInfo.name.withImage {
        case true:
            setImage(buttonInfo.name.systemName)
        case false:
            setTitle(buttonInfo.name.title)
        }
    }
}

extension Button {
    private func setColor() {
        switch buttonInfo.role {
        case .number:
            backgroundColor = .numbersButtonColor
        case .operation:
            backgroundColor = .operatorButtonColor
        }
    }
    
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

#Preview {
    MainViewController()
}
