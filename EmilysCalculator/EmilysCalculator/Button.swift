//
//  Button.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .darkGray
        layer.cornerRadius = 45
        
        titleLabel?.font = .systemFont(ofSize: 40)
        
        setTitleColor(.white, for: .normal)
        setTitleColor(.lightGray, for: .highlighted)
        
        widthAnchor.constraint(equalToConstant: 90).isActive = true
        heightAnchor.constraint(equalToConstant: 90).isActive = true
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

}
