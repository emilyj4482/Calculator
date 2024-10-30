import Foundation

class Calculator {
    
    // 연산 인스턴스
    let operation: AbstractOperation
    
    // 계산 할 수 프로퍼티
    let firstNumber: Double
    let secondNumber: Double
    
    init(operation: AbstractOperation, firstNumber: Double, secondNumber: Double) {
        self.operation = operation
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    func calculate() -> Double {
        operation.calculate(firstNumber, secondNumber)
    }
    
    /*
    // 외부에서 호출할 함수
    func calculate(operation: Operation, firstNumber: Double, secondNumber: Double) -> Double {
        switch operation {
        case .add:
            return addOperation.calculate(firstNumber, secondNumber)
        case .substract:
            return substractOperation.calculate(firstNumber, secondNumber)
        case .multiply:
            return multiplyOperation.calculate(firstNumber, secondNumber)
        case .divide:
            return divideOperation.calculate(firstNumber, secondNumber)
        }
     }
     */
    
    /*
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
    */
    
    // 나머지 연산
    /*
    func remainder(firstNumber a: Double, secondNumber b: Double) -> Double {
        // return a % b
        return a.truncatingRemainder(dividingBy: b)
    }
    */
}

// 연산 종류 enum (protocol을 사용하도록 코드를 수정하면서 쓰지 않게 됨)
enum Operation {
    case add
    case substract
    case multiply
    case divide
}

protocol AbstractOperation {
    func calculate(_: Double, _: Double) -> Double
}

class AddOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubstractOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        if b == 0 {
            print("[ERROR] You cannot divide by zero.")
            return 0
        } else {
            return a / b
        }
    }
}

class RemainderOperation: AbstractOperation {
    func calculate(_ a: Double, _ b: Double) -> Double {
        return a.truncatingRemainder(dividingBy: b)
    }
}

/*
// 인스턴스 생성하여 변수에 할당
let calculator = Calculator()

// calculator 변수를 활용하여 사칙연산 진행
let addResult = calculator.calculate(operation: .add, firstNumber: 1, secondNumber: 2)
let substractResult = calculator.calculate(operation: .substract, firstNumber: 1, secondNumber: 2)
let multiplyResult = calculator.calculate(operation: .multiply, firstNumber: 1, secondNumber: 2)
let divideResult = calculator.calculate(operation: .divide, firstNumber: 1, secondNumber: 0)
let remainderResult = calculator.remainder(firstNumber: 10, secondNumber: 2)
*/

let addResult = Calculator(operation: AddOperation(), firstNumber: 1, secondNumber: 2)
let substractResult = Calculator(operation: SubstractOperation(), firstNumber: 1, secondNumber: 2)
let multiplyResult = Calculator(operation: MultiplyOperation(), firstNumber: 1, secondNumber: 2)
let divideResult = Calculator(operation: DivideOperation(), firstNumber: 10, secondNumber: 0)
let remainderResult = Calculator(operation: RemainderOperation(), firstNumber: 10, secondNumber: 3)

addResult.calculate()
substractResult.calculate()
multiplyResult.calculate()
divideResult.calculate()
remainderResult.calculate()
