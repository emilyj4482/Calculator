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
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.backgroundColor = .black
        view.indicatorStyle = .white
        view.contentAlignmentPoint.x = 1
        
        return view
    }()
    
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
    
    override func viewDidLayoutSubviews() {
        setScrollView()
    }
    
    private func addSubview() {
        [scrollView, buttonView]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        scrollView.addSubview(inputLabel)
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.backgroundColor = .black
        let superView = view.safeAreaLayoutGuide
        
        let offset: CGFloat = 30.0
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: offset),
            scrollView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -offset),
            scrollView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 200),
            scrollView.heightAnchor.constraint(equalToConstant: 100),
            
            inputLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            inputLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            inputLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            inputLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            inputLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            buttonView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 60),
            buttonView.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            buttonView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func setScrollView() {
        // 스크롤 뷰의 content size를 label size와 일치시킴
        scrollView.contentSize = CGSize(width: inputLabel.intrinsicContentSize.width, height: inputLabel.bounds.height)
        
        // 스크롤을 우측에 고정
        let rightOffset = CGPoint(x: scrollView.contentSize.width - scrollView.bounds.width, y: 0)
        scrollView.setContentOffset(rightOffset, animated: false)
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


