//
//  MainViewController.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var processLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 35, weight: .regular)
        // label.isHidden = true
        
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 75, weight: .medium)
        
        return label
    }()
    
    private lazy var buttonArea: UIView = ButtonArea()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // preview를 위한 임시 조치
        view.backgroundColor = .black
        
        addSubview()
        layout()
        bind()
    }
    
    private func addSubview() {
        [processLabel, resultLabel, buttonArea]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        
        let superView = view.safeAreaLayoutGuide
        
        let inset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            buttonArea.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: inset),
            buttonArea.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -inset),
            buttonArea.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -inset),
            buttonArea.heightAnchor.constraint(equalToConstant: 500),
            
            resultLabel.trailingAnchor.constraint(equalTo: buttonArea.trailingAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: buttonArea.topAnchor),
            
            processLabel.trailingAnchor.constraint(equalTo: resultLabel.trailingAnchor),
            processLabel.bottomAnchor.constraint(equalTo: resultLabel.topAnchor)
        ])
    }
    
    private func bind() {
        resultLabel.text = "32,416.67"
        processLabel.text = "778,000÷24"
    }
    
}

#Preview {
    MainViewController()
}
