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
        setColor()
        setButton()
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
    
    // button role에 따라 배경색 다르게 적용
    private func setColor() {
        switch buttonInfo.role {
        case .number:
            backgroundColor = .numbersButtonColor
        case .operation, .completer:
            backgroundColor = .operatorButtonColor
        }
    }
    
    // SF symbols image 적용 버튼과 title 적용 버튼 구분하여 set
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
