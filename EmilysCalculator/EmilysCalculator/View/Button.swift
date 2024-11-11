//
//  Button.swift
//  EmilysCalculator
//
//  Created by EMILY on 28/10/2024.
//

import UIKit
import Combine

class Button: UIButton {
    
    private var cancellables = Set<AnyCancellable>()
    
    private let mainVM = MainViewModel.shared

    let withImage: CurrentValueSubject<Bool, Never> = .init(false)  // UIImage(systemName: )을 통해 버튼 설정하는지 여부
    private let imageSize = PassthroughSubject<CGFloat, Never>()    // auto layout을 위해 size 전송 받음
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setButtonSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setTitle 하는 button에만 적용하기 위해 init 호출에서 아래 withImage.sink 부분으로 이동
    private func setTitleLayout() {
        setTitleColor(.white, for: .normal)
        setTitleColor(.lightGray, for: .highlighted)
    }
    
    private func setButtonSize() {
        // default button width = (screen.width - 16 * 2 - 8 * 3) / 4
        // zero button width = (screen.width - 16 * 2 - 8) / 2
        mainVM.screen
            .combineLatest(withImage)
            .sink { [weak self] screen, withImage in
                let buttonSize = (screen.width - 56) / 4
                
                self?.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
                self?.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
                self?.layer.cornerRadius = buttonSize / 2
                
                if withImage {
                    self?.imageSize.send(buttonSize / 2.5)
                } else {
                    self?.titleLabel?.font = .systemFont(ofSize: buttonSize / 2)
                }
            }
            .store(in: &cancellables)
    }
    
    private func setColor(_ role: ButtonRole) {
        switch role {
        case .number:
            backgroundColor = .number
        case .operation:
            backgroundColor = .operator
        case .modifier:
            backgroundColor = .modifier
        }
    }
    
    func setButton(_ buttonInfo: ButtonInfo) {
        setColor(buttonInfo.role)
        
        withImage
            .sink { [weak self] withImage in
                if withImage {
                    self?.setImage(buttonInfo.name.systemName)
                    self?.tintColor = .white
                } else {
                    self?.setTitle(buttonInfo.name.title, for: .normal)
                    self?.setTitleLayout()
                }
            }
            .store(in: &cancellables)
    }
    
    private func setImage(_ systemName: String) {
        imageSize
            .sink { [weak self] size in
                let imageConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .regular)
                self?.setImage(UIImage(systemName: systemName, withConfiguration: imageConfig), for: .normal)
            }
            .store(in: &cancellables)
    }
}

#Preview {
    MainViewController()
}
