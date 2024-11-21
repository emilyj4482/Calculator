//
//  ScrollView.swift
//  EmilysCalculator
//
//  Created by EMILY on 21/11/2024.
//

import UIKit

class ScrollView: UIScrollView {
    
    lazy var inputLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(inputLabel)
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        backgroundColor = .black
        indicatorStyle = .white
        contentAlignmentPoint = CGPoint(x: 1, y: 0.5)
        
        NSLayoutConstraint.activate([
            inputLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            inputLabel.topAnchor.constraint(equalTo: topAnchor),
            inputLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            inputLabel.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
