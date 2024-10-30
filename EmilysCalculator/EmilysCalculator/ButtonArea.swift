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
        button.setColor(.status)
        
        return button
    }()
    
    private lazy var plusMinusButton: Button = {
        let button = Button()
        
        button.setTitle("+/-")
        button.addAction("+/-")
        button.setColor(.status)
        
        return button
    }()
    
    private lazy var percentButton: Button = {
        let button = Button()
        
        button.setTitle("%")
        button.addAction("%")
        button.setColor(.status)
        
        return button
    }()
    
    private lazy var divideButton: Button = {
        let button = Button()
        
        button.setTitle("/")
        button.addAction("/")
        button.setColor(.operator)
        
        return button
    }()
    
    private lazy var multiplyButton: Button = {
        let button = Button()
        
        button.setTitle("x")
        button.addAction("x")
        button.setColor(.operator)
        
        return button
    }()
    
    private lazy var substractButton: Button = {
        let button = Button()
        
        button.setTitle("-")
        button.addAction("-")
        button.setColor(.operator)
        
        return button
    }()
    
    private lazy var addButton: Button = {
        let button = Button()
        
        button.setTitle("+")
        button.addAction("+")
        button.setColor(.operator)
        
        return button
    }()
    
    private lazy var equalButton: Button = {
        let button = Button()
        
        button.setTitle("=")
        button.addAction("=")
        button.setColor(.operator)
        
        return button
    }()
    
    private lazy var sevenButton: Button = {
        let button = Button()
        
        button.setTitle("7")
        button.addAction("7")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var eightButton: Button = {
        let button = Button()
        
        button.setTitle("8")
        button.addAction("8")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var nineButton: Button = {
        let button = Button()
        
        button.setTitle("9")
        button.addAction("9")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var fourButton: Button = {
        let button = Button()
        
        button.setTitle("4")
        button.addAction("4")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var fiveButton: Button = {
        let button = Button()
        
        button.setTitle("5")
        button.addAction("5")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var sixButton: Button = {
        let button = Button()
        
        button.setTitle("6")
        button.addAction("6")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var oneButton: Button = {
        let button = Button()
        
        button.setTitle("1")
        button.addAction("1")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var twoButton: Button = {
        let button = Button()
        
        button.setTitle("2")
        button.addAction("2")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var threeButton: Button = {
        let button = Button()
        
        button.setTitle("3")
        button.addAction("3")
        button.setColor(.number)
        
        return button
    }()
    
    private var zeroButton: Button = {
        let button = Button()
        
        button.setTitle("0")
        button.addAction("0")
        button.setColor(.number)
        
        return button
    }()
    
    private lazy var dotButton: Button = {
        let button = Button()
        
        button.setTitle(".")
        button.addAction(".")
        button.setColor(.number)
        
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
        ])
    }
}

#Preview {
    MainViewController()
}
