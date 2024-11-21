//
//  CalculationService.swift
//  EmilysCalculator
//
//  Created by EMILY on 13/11/2024.
//

import Foundation

protocol CalculationServiceType {
    func calculate(_ text: String) -> Result<Int, CustomError>
}

class CalculationService: CalculationServiceType {
    func calculate(_ text: String) -> Result<Int, CustomError> {
        guard !text.contains("÷0") else {
            return .failure(CustomError.dividedByZero)
        }
        let replacedText = text.replacingOccurrences(of: "×", with: "*").replacingOccurrences(of: "÷", with: "/")
        let expression = NSExpression(format: replacedText)
        guard let result = expression.expressionValue(with: nil, context: nil) as? Int else {
            return .failure(CustomError.convertingFailed)
        }
        return .success(result)
    }
}
