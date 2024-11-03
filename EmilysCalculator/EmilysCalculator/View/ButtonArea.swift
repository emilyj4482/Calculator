//
//  ButtonArea.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class ButtonArea: UIView {
    
    private lazy var clearButton: Button = {
        let button = Button()
        button.setButton(.init(group: .modifier, name: .allClear))
        return button
    }()
    
    private lazy var plusMinusButton: Button = {
        let button = Button()
        button.setButton(.init(group: .modifier, name: .plusMinus))
        return button
    }()
    
    private lazy var percentButton: Button = {
        let button = Button()
        button.setButton(.init(group: .modifier, name: .percent))
        return button
    }()
    
    private lazy var divideButton: Button = {
        let button = Button()
        button.setButton(.init(group: .operation, name: .divide))
        return button
    }()
    
    private lazy var multiplyButton: Button = {
        let button = Button()
        button.setButton(.init(group: .operation, name: .multiply))
        return button
    }()
    
    private lazy var subtractButton: Button = {
        let button = Button()
        button.setButton(.init(group: .operation, name: .subtract))
        return button
    }()
    
    private lazy var addButton: Button = {
        let button = Button()
        button.setButton(.init(group: .operation, name: .add))
        return button
    }()
    
    private lazy var equalButton: Button = {
        let button = Button()
        button.setButton(.init(group: .operation, name: .equal))
        return button
    }()
    
    private lazy var sevenButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .seven))
        return button
    }()
    
    private lazy var eightButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .eight))
        return button
    }()
    
    private lazy var nineButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .nine))
        return button
    }()
    
    private lazy var fourButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .four))
        return button
    }()
    
    private lazy var fiveButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .five))
        return button
    }()
    
    private lazy var sixButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .six))
        return button
    }()
    
    private lazy var oneButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .one))
        return button
    }()
    
    private lazy var twoButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .two))
        return button
    }()
    
    private lazy var threeButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .three))
        return button
    }()
    
    private lazy var zeroButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .zero))
        button.isZero.send(true)
        return button
    }()
    
    private lazy var decimalButton: Button = {
        let button = Button()
        button.setButton(.init(group: .number, name: .decimal))
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
        [clearButton, plusMinusButton, percentButton, divideButton, multiplyButton, subtractButton, addButton, equalButton, sevenButton, eightButton, nineButton, fourButton, fiveButton, sixButton, oneButton, twoButton, threeButton, zeroButton, decimalButton]
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
            clearButton.topAnchor.constraint(equalTo: topAnchor),
            clearButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            plusMinusButton.topAnchor.constraint(equalTo: clearButton.topAnchor),
            plusMinusButton.leadingAnchor.constraint(equalTo: clearButton.trailingAnchor, constant: inset),
            
            percentButton.topAnchor.constraint(equalTo: clearButton.topAnchor),
            percentButton.leadingAnchor.constraint(equalTo: plusMinusButton.trailingAnchor, constant: inset),
            
            divideButton.topAnchor.constraint(equalTo: clearButton.topAnchor),
            divideButton.leadingAnchor.constraint(equalTo: percentButton.trailingAnchor, constant: inset),
            
            multiplyButton.topAnchor.constraint(equalTo: divideButton.bottomAnchor, constant: inset),
            multiplyButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
            
            subtractButton.topAnchor.constraint(equalTo: multiplyButton.bottomAnchor, constant: inset),
            subtractButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
            
            addButton.topAnchor.constraint(equalTo: subtractButton.bottomAnchor, constant: inset),
            addButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
            
            equalButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: inset),
            equalButton.trailingAnchor.constraint(equalTo: divideButton.trailingAnchor),
            
            sevenButton.topAnchor.constraint(equalTo: clearButton.bottomAnchor, constant: inset),
            sevenButton.leadingAnchor.constraint(equalTo: clearButton.leadingAnchor),
            
            eightButton.topAnchor.constraint(equalTo: sevenButton.topAnchor),
            eightButton.leadingAnchor.constraint(equalTo: sevenButton.trailingAnchor, constant: inset),
            
            nineButton.topAnchor.constraint(equalTo: sevenButton.topAnchor),
            nineButton.leadingAnchor.constraint(equalTo: eightButton.trailingAnchor, constant: inset),
            
            fourButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: inset),
            fourButton.leadingAnchor.constraint(equalTo: clearButton.leadingAnchor),
            
            fiveButton.topAnchor.constraint(equalTo: fourButton.topAnchor),
            fiveButton.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor, constant: inset),
            
            sixButton.topAnchor.constraint(equalTo: fourButton.topAnchor),
            sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor, constant: inset),
            
            oneButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: inset),
            oneButton.leadingAnchor.constraint(equalTo: clearButton.leadingAnchor),
            
            twoButton.topAnchor.constraint(equalTo: oneButton.topAnchor),
            twoButton.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor, constant: inset),
            
            threeButton.topAnchor.constraint(equalTo: oneButton.topAnchor),
            threeButton.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor, constant: inset),
            
            zeroButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: inset),
            zeroButton.leadingAnchor.constraint(equalTo: clearButton.leadingAnchor),
            
            decimalButton.topAnchor.constraint(equalTo: zeroButton.topAnchor),
            decimalButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -inset),
            
            // 0 button text 위치
            zeroButtonLabel.leadingAnchor.constraint(equalTo: oneButtonLabel.leadingAnchor)
        ])
    }
}

#Preview {
    MainViewController()
}
