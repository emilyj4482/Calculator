import Foundation

class Calculator {
    // 외부에서 호출할 함수
    // 파라미터 : 연산 종류, 연산 대상 수 2개
    // 반환 : 연산 결과
    func calculate(operation: Operation, firstNumber: Double, secondNumber: Double) -> Double {
        switch operation {
        case .add:
            return add(firstNumber, secondNumber)
        case .substract:
            return substract(firstNumber, secondNumber)
        case .multiply:
            return multiply(firstNumber, secondNumber)
        case .divide:
            return divide(firstNumber, secondNumber)
        }

    }
    
    // 사칙연산 수행 함수
    private func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    private func substract(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    private func multiply(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
    
    private func divide(_ a: Double, _ b: Double) -> Double {
        return a / b
    }
}

// 연산 종류 enum
enum Operation {
    case add
    case substract
    case multiply
    case divide
}

// 인스턴스 생성하여 변수에 할당
let calculator = Calculator()

// calculator 변수를 활용하여 사칙연산 진행
let addResult = calculator.calculate(operation: .add, firstNumber: 1, secondNumber: 2)
let substractResult = calculator.calculate(operation: .substract, firstNumber: 1, secondNumber: 2)
let multiplyResult = calculator.calculate(operation: .multiply, firstNumber: 1, secondNumber: 2)
let divideResult = calculator.calculate(operation: .divide, firstNumber: 1, secondNumber: 2)
