//
//  MainViewController.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var inputLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .right
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // preview를 위한 임시 조치
        view.backgroundColor = .black
        
        addSubview()
        layout()
        bind()
    }
    
    private func addSubview() {
        [inputLabel]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        let superView = view.safeAreaLayoutGuide
        
        let offset: CGFloat = 30.0
        
        NSLayoutConstraint.activate([
            
            inputLabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: offset),
            inputLabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -offset),
            inputLabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 200),
        ])
    }
    
    private func bind() {
        inputLabel.text = "12345"
    }
}

#Preview {
    MainViewController()
}


