//
//  ButtonInfo.swift
//  EmilysCalculator
//
//  Created by EMILY on 03/11/2024.
//

import Foundation

struct ButtonInfo {
    let role: ButtonRole
    let name: ButtonName
    
    static let buttons: [ButtonInfo] = [
        .init(role: .number, name: .seven),
        .init(role: .number, name: .eight),
        .init(role: .number, name: .nine),
        .init(role: .operation, name: .add),
        
        .init(role: .number, name: .four),
        .init(role: .number, name: .five),
        .init(role: .number, name: .six),
        .init(role: .operation, name: .subtract),
        
        .init(role: .number, name: .one),
        .init(role: .number, name: .two),
        .init(role: .number, name: .three),
        .init(role: .operation, name: .multiply),
        
        .init(role: .completer, name: .clear),
        .init(role: .number, name: .zero),
        .init(role: .completer, name: .equal),
        .init(role: .operation, name: .divide)
    ]
}

enum ButtonRole {
    case number, operation, completer
}

enum ButtonName {
    case one, two, three, four, five, six, seven, eight, nine, zero
    case add, subtract, multiply, divide
    case clear, equal
    
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
        case .clear: return "AC"
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "÷"
        case .equal: return "="
        }
    }
    
    var systemName: String {
        switch self {
        case .add: return "plus"
        case .subtract: return "minus"
        case .multiply: return "multiply"
        case .divide: return "divide"
        case .equal: return "equal"
        default: return ""
        }
    }
    
    var withImage: Bool {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal : true
        default: false
        }
    }
}
