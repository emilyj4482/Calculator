//
//  VerticalStackView.swift
//  EmilysCalculator
//
//  Created by EMILY on 11/11/2024.
//

import UIKit

class VerticalStackView: UIStackView {
    init() {
        super.init(frame: .zero)
        layout()
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
    
    func addSubviews(_ hStacks: [HorizontalStackView]) {
        hStacks.forEach {
            addArrangedSubview($0)
        }
    }
}
