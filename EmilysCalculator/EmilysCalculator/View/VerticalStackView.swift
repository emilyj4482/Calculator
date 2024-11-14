//
//  VerticalStackView.swift
//  EmilysCalculator
//
//  Created by EMILY on 11/11/2024.
//

import UIKit

class VerticalStackView: UIStackView {
    private lazy var firstHStack: HorizontalStackView = {
        let stackView = HorizontalStackView()
        
        let sevenButton = Button(buttonInfo: .init(role: .number, name: .seven))
        let eightButton = Button(buttonInfo: .init(role: .number, name: .eight))
        let nineButton = Button(buttonInfo: .init(role: .number, name: .nine))
        let addButton = Button(buttonInfo: .init(role: .operation, name: .add))
        
        stackView.addSubviews([sevenButton, eightButton, nineButton, addButton])
        
        return stackView
    }()
    
    private lazy var secondHStack: HorizontalStackView = {
        let stackView = HorizontalStackView()
        
        let fourButton = Button(buttonInfo: .init(role: .number, name: .four))
        let fiveButton = Button(buttonInfo: .init(role: .number, name: .five))
        let sixButton = Button(buttonInfo: .init(role: .number, name: .six))
        let subtractButton = Button(buttonInfo: .init(role: .operation, name: .subtract))
        
        stackView.addSubviews([fourButton, fiveButton, sixButton, subtractButton])
        
        return stackView
    }()
    
    private lazy var thirdHStack: HorizontalStackView = {
        let stackView = HorizontalStackView()
        
        let oneButton = Button(buttonInfo: .init(role: .number, name: .one))
        let twoButton = Button(buttonInfo: .init(role: .number, name: .two))
        let threeButton = Button(buttonInfo: .init(role: .number, name: .three))
        let multiplyButton = Button(buttonInfo: .init(role: .operation, name: .multiply))
        
        stackView.addSubviews([oneButton, twoButton, threeButton, multiplyButton])
        
        return stackView
    }()
    
    private lazy var fourthHStack: HorizontalStackView = {
        let stackView = HorizontalStackView()
        
        let clearButton = Button(buttonInfo: .init(role: .completer, name: .clear))
        let zeroButton = Button(buttonInfo: .init(role: .number, name: .zero))
        let equalButton = Button(buttonInfo: .init(role: .completer, name: .equal))
        let divideButton = Button(buttonInfo: .init(role: .operation, name: .divide))
        
        stackView.addSubviews([clearButton, zeroButton, equalButton, divideButton])
        
        return stackView
    }()
    
    
    init() {
        super.init(frame: .zero)
        layout()
        addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        axis = .vertical
        backgroundColor = .black
        spacing = 10
        distribution = .fillEqually
    }
    
    private func addSubviews() {
        [firstHStack, secondHStack, thirdHStack, fourthHStack]
            .forEach {
                addArrangedSubview($0)
            }
    }
}
