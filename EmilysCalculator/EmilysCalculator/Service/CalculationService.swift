//
//  CalculationService.swift
//  EmilysCalculator
//
//  Created by EMILY on 13/11/2024.
//

import Foundation

protocol CalculationServiceType {
    
}

class CalculationService: CalculationServiceType {
    func calculate(_ expression: String) -> Result<Int, CustomError> {
        guard !expression.contains("/0") else {
            return .failure(CustomError.dividedByZero)
        }
        let expression = NSExpression(format: expression)
        guard let result = expression.expressionValue(with: nil, context: nil) as? Int else {
            return .failure(CustomError.convertingFailed)
        }
        return .success(result)
    }
}
