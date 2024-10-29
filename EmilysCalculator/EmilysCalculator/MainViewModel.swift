//
//  MainViewModel.swift
//  EmilysCalculator
//
//  Created by EMILY on 29/10/2024.
//

import Foundation
import Combine

final class MainViewModel {
    
    var cancellables = Set<AnyCancellable>()
    
    // default size : iPhone 16 Pro : 402 * 874
    let screen = CurrentValueSubject<(width: CGFloat, height: CGFloat), Never>((402, 874))
    
    init() {
        screen
            .sink {
                print("width: \($0.width), height: \($0.height)")
            }
            .store(in: &cancellables)
    }
}
