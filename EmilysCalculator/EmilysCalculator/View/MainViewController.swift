//
//  MainViewController.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    private var cancellables = Set<AnyCancellable>()
    
    private let buttonTapService = ButtonTapService.shared
    
    private lazy var inputLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        
        return label
    }()
    
    private lazy var buttonView = VerticalStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        layout()
        bind()
    }
    
    private func addSubview() {
        [inputLabel, buttonView]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        view.backgroundColor = .black
        let superView = view.safeAreaLayoutGuide
        
        let offset: CGFloat = 30.0
        
        NSLayoutConstraint.activate([
            inputLabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: offset),
            inputLabel.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -offset),
            inputLabel.topAnchor.constraint(equalTo: superView.topAnchor, constant: 200),
            inputLabel.heightAnchor.constraint(equalToConstant: 100),
            
            buttonView.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 60),
            buttonView.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            buttonView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func bind() {
        buttonTapService.$textStack
            .sink { [weak self] text in
                self?.inputLabel.text = text
            }
            .store(in: &cancellables)
    }
}

#Preview {
    MainViewController()
}


