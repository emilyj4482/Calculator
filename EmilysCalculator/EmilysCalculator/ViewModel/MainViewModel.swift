//
//  MainViewModel.swift
//  EmilysCalculator
//
//  Created by EMILY on 29/10/2024.
//

import UIKit
import Combine

final class MainViewModel {
    
    // 변수명 바꿔야 할 것 같은데...
    @Published var numbersTypedIn: String = ""
    @Published var calculationResult: String?
    
    static let shared = MainViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let service = ButtonTapService()
    
    // preview 용 default size : iphone 16 pro max
    // let screen = CurrentValueSubject<(width: CGFloat, height: CGFloat), Never>((width: 440, height: 956))
    let screen = PassthroughSubject<(width: CGFloat, height: CGFloat), Never>()
    
    // AC / CE toggle
    @Published var showAC: Bool = true
    
    init() {
        toggleClearButton()
    }
    
    func buttonTapped(_ buttonInfo: ButtonInfo) -> UIAction {
        switch buttonInfo.role {
        case .number:
            UIAction { [weak self] _ in
                if self?.numbersTypedIn == "0" {
                    self?.numbersTypedIn = buttonInfo.name.title
                } else {
                    self?.numbersTypedIn.append(buttonInfo.name.title)
                }
            }
        case .operation:
            UIAction { [weak self] _ in
                if buttonInfo.name == .equal {
                    let expression = NSExpression(format: (self?.numbersTypedIn.replacingOccurrences(of: "x", with: "*"))!)
                    let result = expression.expressionValue(with: nil, context: nil) as? Int
                    
                    self?.numbersTypedIn = result?.description ?? "Error"
                    
                    // TODO: 공식이 미완성 상태 일 때 tap 시 아무 동작도 안하도록 처리
                    
                    // MARK: CE button을 AC로 전환
                    self?.showAC = true
                } else {
                    self?.numbersTypedIn.append(buttonInfo.name.title)
                }
            }
        case .modifier:
            modifierButtonTapped(buttonInfo.name)
        }
    }
    
    private func modifierButtonTapped(_ buttonName: ButtonName) -> UIAction {
        
        let defaultAction = UIAction(handler: { _ in })
        
        switch buttonName {
        case .allClear:
            return UIAction { [weak self] _ in self?.numbersTypedIn = "0" }
        case .ClearEntry:
            return UIAction { [weak self] _ in
                guard var modifiedText = self?.numbersTypedIn else { return }
                self?.service.clearEntry(&modifiedText)
                self?.numbersTypedIn = modifiedText
            }
        case .plusMinus:
            return defaultAction
        case .percent:
            return defaultAction
        default:
            return defaultAction
        }
    }
    
    private func toggleClearButton() {
        $numbersTypedIn
            .sink { [weak self] text in
                self?.showAC = text.count < 2
            }
            .store(in: &cancellables)
    }
    
}
