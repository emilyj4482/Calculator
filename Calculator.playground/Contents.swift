import Foundation

class Calculator {
    // TODO: 내부 구현하기
    func calculate(firstNumber: Double, secondNumber: Double, operation: Operation) -> Double {
        return 0.0
    }
}

enum Operation {
    case add
    case substract
    case multiply
    case divide
}

// 인스턴스 생성하여 변수에 할당
let calculator = Calculator()

// TODO: calculator 변수를 활용하여 사칙연산을 진행
let result = calculator.calculate(firstNumber: 1, secondNumber: 2, operation: .add)

print(result)
