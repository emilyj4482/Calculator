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
    
    let mainVM = MainViewModel.shared
    
    private lazy var processLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 35, weight: .regular)
        label.textAlignment = .right
        // label.isHidden = true
        
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 75, weight: .medium)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var buttonArea: UIView = ButtonArea()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // preview를 위한 임시 조치
        view.backgroundColor = .black
        
        addSubview()
        layout()
        // bind()
        sink()
    }
    
    private func addSubview() {
        [processLabel, resultLabel, buttonArea]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    private func layout() {
        
        setButtonAreaHeight()
        
        let superView = view.safeAreaLayoutGuide
        
        let inset: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            buttonArea.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: inset),
            buttonArea.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -inset),
            buttonArea.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -inset),
            
            resultLabel.trailingAnchor.constraint(equalTo: buttonArea.trailingAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: buttonArea.topAnchor, constant: -8.0),
            resultLabel.widthAnchor.constraint(equalTo: buttonArea.widthAnchor),
            
            processLabel.trailingAnchor.constraint(equalTo: resultLabel.trailingAnchor),
            processLabel.bottomAnchor.constraint(equalTo: resultLabel.topAnchor),
            processLabel.widthAnchor.constraint(equalTo: resultLabel.widthAnchor)
        ])
    }
    
    private func setButtonAreaHeight() {
        // ButtonArea 높이 = 화면 전체 높이의 60%
        mainVM.screen
            .sink { [weak self] screen in
                self?.buttonArea.heightAnchor.constraint(equalToConstant: screen.height * 0.6).isActive = true
            }
            .store(in: &cancellables)
    }
    
    private func bind() {
        resultLabel.text = "0"
        processLabel.text = ""
    }
    
    private func sink() {
        mainVM.$numbersTypedIn
            .sink { [weak self] text in
                self?.resultLabel.text = text
            }
            .store(in: &cancellables)
    }
    
}

#Preview {
    MainViewController()
}
