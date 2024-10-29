//
//  MainViewModel.swift
//  EmilysCalculator
//
//  Created by EMILY on 29/10/2024.
//

import Foundation
import Combine

final class MainViewModel {
    
    static let shared = MainViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    let screen = PassthroughSubject<(width: CGFloat, height: CGFloat), Never>()
    
    // screen size debugging
    init() {
        screen
            .sink {
                print("width: \($0.width), height: \($0.height)")
            }
            .store(in: &cancellables)
    }
}
