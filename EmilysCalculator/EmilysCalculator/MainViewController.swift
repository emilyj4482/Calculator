//
//  ViewController.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        layout()
        bind()
    }
    
    private func addSubview() {
        view.addSubview(testLabel)
        testLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        
        let superView = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ])
    }
    
    private func bind() {
        testLabel.text = "Hello"
        
    }
    
}

#Preview {
    MainViewController()
}
