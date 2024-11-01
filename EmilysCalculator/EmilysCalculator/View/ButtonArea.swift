//
//  ButtonArea.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class ButtonArea: UIView {
    
    let service = ButtonTapService()
    
    private lazy var ACButton: Button = {
        let button = Button()
        
        button.setButton("AC")
        button.configureAs(.modifier)
        
        return button
    }()
    
    private lazy var plusMinusButton: Button = {
        let button = Button()
        
        button.setButton("+/-")
        button.configureAs(.modifier)
        
        return button
    }()
    
    private lazy var percentButton: Button = {
        let button = Button()
        
        button.setButton("%")
        button.configureAs(.modifier)

        return button
    }()
    
    private lazy var divideButton: Button = {
        let button = Button()
        
        button.setButton("/")
        button.configureAs(.operation)
        
        return button
    }()
    
    private lazy var multiplyButton: Button = {
        let button = Button()
        
        button.setButton("x")
        button.configureAs(.operation)
        
        return button
    }()
    
    private lazy var substractButton: Button = {
        let button = Button()
        
        button.setButton("-")
        button.configureAs(.operation)
        
        return button
    }()
    
    private lazy var addButton: Button = {
        let button = Button()
        
        button.setButton("+")
        button.configureAs(.operation)
        
        return button
    }()
    
    private lazy var equalButton: Button = {
        let button = Button()
        
        button.setButton("=")
        button.configureAs(.operation)
        
        return button
    }()
    
    private lazy var sevenButton: Button = {
        let button = Button()
        
        button.setButton("7")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var eightButton: Button = {
        let button = Button()
        
        button.setButton("8")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var nineButton: Button = {
        let button = Button()
        
        button.setButton("9")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var fourButton: Button = {
        let button = Button()
        
        button.setButton("4")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var fiveButton: Button = {
        let button = Button()
        
        button.setButton("5")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var sixButton: Button = {
        let button = Button()
        
        button.setButton("4")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var oneButton: Button = {
        let button = Button()
        
        button.setButton("1")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var twoButton: Button = {
        let button = Button()
        
        button.setButton("2")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var threeButton: Button = {
        let button = Button()
        
        button.setButton("3")
        button.configureAs(.number)
        
        return button
    }()
    
    private lazy var zeroButton: Button = {
        let button = Button()
        
        button.setButton("0")
        button.configureAs(.number)
        button.isZero.send(true)
        
        return button
    }()
    
    private lazy var dotButton: Button = {
        let button = Button()
        
        button.setButton(".")
        button.configureAs(.number)
        
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
        [ACButton, plusMinusButton, percentButton, divideButton, multiplyButton, substractButton, addButton, equalButton, sevenButton, eightButton, nineButton, fourButton, fiveButton, sixButton, oneButton, twoButton, threeButton, zeroButton, dotButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        
        guard
            let oneButtonLabel = oneButton.titleLabel,
            let zeroButtonLabel = zeroButton.titleLabel
        else { return }
        
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
            
            sevenButton.topAnchor.constraint(equalTo: ACButton.bottomAnchor, constant: inset),
            sevenButton.leadingAnchor.constraint(equalTo: ACButton.leadingAnchor),
            
            eightButton.topAnchor.constraint(equalTo: sevenButton.topAnchor),
            eightButton.leadingAnchor.constraint(equalTo: sevenButton.trailingAnchor, constant: inset),
            
            nineButton.topAnchor.constraint(equalTo: sevenButton.topAnchor),
            nineButton.leadingAnchor.constraint(equalTo: eightButton.trailingAnchor, constant: inset),
            
            fourButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: inset),
            fourButton.leadingAnchor.constraint(equalTo: ACButton.leadingAnchor),
            
            fiveButton.topAnchor.constraint(equalTo: fourButton.topAnchor),
            fiveButton.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor, constant: inset),
            
            sixButton.topAnchor.constraint(equalTo: fourButton.topAnchor),
            sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor, constant: inset),
            
            oneButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: inset),
            oneButton.leadingAnchor.constraint(equalTo: ACButton.leadingAnchor),
            
            twoButton.topAnchor.constraint(equalTo: oneButton.topAnchor),
            twoButton.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor, constant: inset),
            
            threeButton.topAnchor.constraint(equalTo: oneButton.topAnchor),
            threeButton.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor, constant: inset),
            
            zeroButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: inset),
            zeroButton.leadingAnchor.constraint(equalTo: ACButton.leadingAnchor),
            
            dotButton.topAnchor.constraint(equalTo: zeroButton.topAnchor),
            dotButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -inset),
            
            // 0 button text 위치
            zeroButtonLabel.leadingAnchor.constraint(equalTo: oneButtonLabel.leadingAnchor)
        ])
    }
}

#Preview {
    MainViewController()
}
