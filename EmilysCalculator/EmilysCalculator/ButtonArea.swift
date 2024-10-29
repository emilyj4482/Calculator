//
//  ButtonArea.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class ButtonArea: UIView {
    
    private lazy var ACButton: Button = {
        let button = Button()
        
        button.setTitle("AC")
        button.addAction("AC")
        button.setColor(.darkGray)
        
        return button
    }()
    
    private lazy var plusMinusButton: Button = {
        let button = Button()
        
        button.setTitle("+/-")
        button.addAction("+/-")
        button.setColor(.darkGray)
        
        return button
    }()
    
    private lazy var percentButton: Button = {
        let button = Button()
        
        button.setTitle("%")
        button.addAction("%")
        button.setColor(.darkGray)
        
        return button
    }()
    
    private lazy var divideButton: Button = {
        let button = Button()
        
        button.setTitle("/")
        button.addAction("/")
        button.setColor(.orange)
        
        return button
    }()
    
    private lazy var multiplyButton: Button = {
        let button = Button()
        
        button.setTitle("x")
        button.addAction("x")
        button.setColor(.orange)
        
        return button
    }()
    
    private lazy var substractButton: Button = {
        let button = Button()
        
        button.setTitle("-")
        button.addAction("-")
        button.setColor(.orange)
        
        return button
    }()
    
    private lazy var addButton: Button = {
        let button = Button()
        
        button.setTitle("+")
        button.addAction("+")
        button.setColor(.orange)
        
        return button
    }()
    
    private lazy var equalButton: Button = {
        let button = Button()
        
        button.setTitle("=")
        button.addAction("=")
        button.setColor(.orange)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        [ACButton, plusMinusButton, percentButton, divideButton, multiplyButton, substractButton, addButton, equalButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        
        let inset: CGFloat = 8.0
        
        NSLayoutConstraint.activate([
            ACButton.topAnchor.constraint(equalTo: topAnchor),
            ACButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            plusMinusButton.topAnchor.constraint(equalTo: ACButton.topAnchor),
            plusMinusButton.leadingAnchor.constraint(equalTo: ACButton.trailingAnchor, constant: inset),
            
            percentButton.topAnchor.constraint(equalTo: ACButton.topAnchor),
            percentButton.leadingAnchor.constraint(equalTo: plusMinusButton.trailingAnchor, constant: inset),
            
            divideButton.topAnchor.constraint(equalTo: ACButton.topAnchor),
            divideButton.leadingAnchor.constraint(equalTo: percentButton.trailingAnchor, constant: inset),
            
            multiplyButton.topAnchor.constraint(equalTo: divideButton.bottomAnchor, constant: inset),
            multiplyButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
            
            substractButton.topAnchor.constraint(equalTo: multiplyButton.bottomAnchor, constant: inset),
            substractButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
            
            addButton.topAnchor.constraint(equalTo: substractButton.bottomAnchor, constant: inset),
            addButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
            
            equalButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: inset),
            equalButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
        ])
    }
}

#Preview {
    MainViewController()
}
