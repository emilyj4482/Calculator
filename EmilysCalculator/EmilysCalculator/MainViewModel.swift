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
    let screen = CurrentValueSubject<(width: CGFloat, height: CGFloat), Never>((width: 440, height: 956))
    
    // let screen = PassthroughSubject<(width: CGFloat, height: CGFloat), Never>()
    
    func buttonTapped(_ buttonInfo: ButtonInfo) -> UIAction {
        switch buttonInfo.group {
        case .number:
            UIAction { [weak self] _ in
                print("\(buttonInfo.name.title) button tapped")
                if self?.numbersTypedIn == "0" {
                    self?.numbersTypedIn = buttonInfo.name.title
                } else {
                    self?.numbersTypedIn += buttonInfo.name.title
                }
            }
        case .operation:
            service.testAction(buttonInfo)
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
            return UIAction { [weak self] _ in self?.numbersTypedIn.removeLast() }
        case .plusMinus:
            return defaultAction
        case .percent:
            return defaultAction
        default:
            return defaultAction
        }
    }
    
}
