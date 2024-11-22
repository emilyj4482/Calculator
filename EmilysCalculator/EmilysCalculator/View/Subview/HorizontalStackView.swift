//
//  HorizontalStackView.swift
//  EmilysCalculator
//
//  Created by EMILY on 11/11/2024.
//

import UIKit

class HorizontalStackView: UIStackView {
    init(_ subviews: [Button]) {
        super.init(frame: .zero)
        layout()
        addSubviews(subviews)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HorizontalStackView {
    func layout() {
        axis = .horizontal
        backgroundColor = .black
        spacing = 10
        distribution = .fillEqually
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func addSubviews(_ buttons: [Button]) {
        buttons.forEach {
            addArrangedSubview($0)
        }
    }
}
