//
//  ButtonArea.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit
import Combine

class ButtonArea: UIView {
    
    private var cancellables = Set<AnyCancellable>()
    
    private let mainVM = MainViewModel.shared
    
    private lazy var allClearButton: Button = {
        let button = Button()
        button.setButton(.init(role: .modifier, name: .allClear))
        return button
    }()

    private lazy var divideButton: Button = {
        let button = Button()
        button.withImage.send(true)
        button.setButton(.init(role: .operation, name: .divide))
        return button
    }()
    
    private lazy var multiplyButton: Button = {
        let button = Button()
        button.withImage.send(true)
        button.setButton(.init(role: .operation, name: .multiply))
        return button
    }()
    
    private lazy var subtractButton: Button = {
        let button = Button()
        button.withImage.send(true)
        button.setButton(.init(role: .operation, name: .subtract))
        return button
    }()
    
    private lazy var addButton: Button = {
        let button = Button()
        button.withImage.send(true)
        button.setButton(.init(role: .operation, name: .add))
        return button
    }()
    
    private lazy var equalButton: Button = {
        let button = Button()
        button.withImage.send(true)
        button.setButton(.init(role: .operation, name: .equal))
        return button
    }()
    
    private lazy var sevenButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .seven))
        return button
    }()
    
    private lazy var eightButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .eight))
        return button
    }()
    
    private lazy var nineButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .nine))
        return button
    }()
    
    private lazy var fourButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .four))
        return button
    }()
    
    private lazy var fiveButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .five))
        return button
    }()
    
    private lazy var sixButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .six))
        return button
    }()
    
    private lazy var oneButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .one))
        return button
    }()
    
    private lazy var twoButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .two))
        return button
    }()
    
    private lazy var threeButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .three))
        return button
    }()
    
    private lazy var zeroButton: Button = {
        let button = Button()
        button.setButton(.init(role: .number, name: .zero))
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
        [allClearButton, divideButton, multiplyButton, subtractButton, addButton, equalButton, sevenButton, eightButton, nineButton, fourButton, fiveButton, sixButton, oneButton, twoButton, threeButton, zeroButton]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            
        ])
    }
}

#Preview {
    MainViewController()
}
