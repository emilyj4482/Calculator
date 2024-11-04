//
//  ButtonInfo.swift
//  EmilysCalculator
//
//  Created by EMILY on 03/11/2024.
//

import Foundation

struct ButtonInfo {
    let group: ButtonRole
    let name: ButtonName
}

enum ButtonRole {
    case number, operation, modifier
}

enum ButtonName {
    case one, two, three, four, five, six, seven, eight, nine, zero, decimal
    case allClear, ClearEntry, plusMinus, percent
    case add, subtract, multiply, divide, equal
    
    var title: String {
        switch self {
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .zero: return "0"
        case .decimal: return "."
        case .allClear: return "AC"
        case .ClearEntry: return "CE"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        case .equal: return "="
        }
    }
}
