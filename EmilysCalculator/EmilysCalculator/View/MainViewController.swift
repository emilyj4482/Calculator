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
    
    private let vm = MainViewModel()
    
    // main view 구성 : 1) label을 포함한 scroll view 2) button을 4개씩 담은 h-stack view를 4개 갖는 v-stack view
    private lazy var scrollView = ScrollView()
    private lazy var buttonView = VerticalStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        layout()
        bind()
        addButtons()
    }
    
    override func viewDidLayoutSubviews() {
        keepScrollRightHandSide()
    }
}

private extension MainViewController {
    func addSubview() {
        [scrollView, buttonView]
            .forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    func layout() {
        view.backgroundColor = .black
        
        let superView = view.safeAreaLayoutGuide
        let offset: CGFloat = 30.0
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: offset),
            scrollView.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -offset),
            scrollView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 200),
            scrollView.heightAnchor.constraint(equalToConstant: 100),
            
            buttonView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 60),
            buttonView.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            buttonView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    // view model에 선언한 ButtonInfo array 순서에 따라 버튼 생성 > 버튼 4개씩 가진 h-stack view 4개 생성 > v-stack에 추가
    func addButtons() {
        var hStacks = [HorizontalStackView]()
        
        for row in 0..<4 {
            var subviews = [Button]()
            
            for col in 0..<4 {
                let index = row * 4 + col
                let button = Button(buttonInfo: vm.buttons[index])
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                subviews.append(button)
            }
            hStacks.append(HorizontalStackView(subviews))
        }
        buttonView.addSubviews(hStacks)
    }
    
    // 스크롤이 오른쪽 끝에 위치하도록 하는 함수 (layout이 적용된 뒤 호출)
    func keepScrollRightHandSide() {
        scrollView.contentSize = CGSize(width: scrollView.inputLabel.intrinsicContentSize.width, height: scrollView.inputLabel.bounds.height)
        scrollView.contentOffset = CGPoint(x: scrollView.contentSize.width - scrollView.bounds.width, y: 0)
    }
    
    // label text update
    func bind() {
        vm.$inputLabelText
            .sink { [weak self] text in
                self?.scrollView.inputLabel.text = text
            }
            .store(in: &cancellables)
    }
}

extension MainViewController {
    @objc func buttonTapped(_ sender: Button) {
        vm.send(sender.buttonInfo)
    }
}

#Preview {
    MainViewController()
}
