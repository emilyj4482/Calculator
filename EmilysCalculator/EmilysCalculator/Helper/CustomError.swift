//
//  CustomError.swift
//  EmilysCalculator
//
//  Created by EMILY on 14/11/2024.
//

import Foundation

enum CustomError: Error {
    case convertingFailed
    
    var localizedDescription: String {
        switch self {
        case .convertingFailed: "[ERROR] Converting to Int failed."
        }
    }
}
