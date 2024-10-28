//
//  ButtonArea.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class ButtonArea: UIView {
    
    private var testButton: Button = {
        let button = Button()
        
        button.setTitle("AC")
        button.addAction("AC")
        
        return button
    }()
    
    private var testButton2: Button = {
        let button = Button()
        
        button.setTitle("+/-")
        button.addAction("+/-")
        
        return button
    }()
    
    private var testButton3: Button = {
        let button = Button()
        
        button.setTitle("%")
        button.addAction("%")
        
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
        [testButton, testButton2, testButton3]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        
        let inset: CGFloat = 8.0
        
        NSLayoutConstraint.activate([
            testButton.topAnchor.constraint(equalTo: topAnchor),
            testButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            testButton2.topAnchor.constraint(equalTo: testButton.topAnchor),
            testButton2.leadingAnchor.constraint(equalTo: testButton.trailingAnchor, constant: inset),
            
            testButton3.topAnchor.constraint(equalTo: testButton.topAnchor),
            testButton3.leadingAnchor.constraint(equalTo: testButton2.trailingAnchor, constant: inset),
        ])
    }
}

#Preview {
    MainViewController()
}
