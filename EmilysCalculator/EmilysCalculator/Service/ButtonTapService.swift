//
//  ButtonTapService.swift
//  EmilysCalculator
//
//  Created by EMILY on 13/11/2024.
//

import Foundation
import Combine

protocol ButtonTapServiceType {
    var textPublisher: CurrentValueSubject<String, Never> { get set }
    func buttonTapped(of buttonInfo: ButtonInfo)
}

class ButtonTapService: ButtonTapServiceType {
    
    var textPublisher = CurrentValueSubject<String, Never>("0")
    
    private var buttonTapHistory: (ButtonInfo?, ButtonInfo?)
    
    // 버튼 role에 따라 동작 함수 호출
    func buttonTapped(of buttonInfo: ButtonInfo) {
        switch buttonInfo.role {
        case .number:
            if textPublisher.value == "Error" {
                print("Only AC button allowed")
            } else {
                numberButtonTapped(of: buttonInfo)
            }
        case .operation:
            if textPublisher.value == "Error" {
                print("Only AC button allowed")
            } else {
                operationButtonTapped(of: buttonInfo)
            }
        case .completer:
            completerButtonTapped(of: buttonInfo)
        }
    }
}

// 버튼 동작 함수에서 경우에 따라 다르게 호출되는 text updating 함수들 + 버튼 탭 히스토리 update 함수
extension ButtonTapService {
    private func replaceText(_ text: String) {
        textPublisher.send(text)
    }
    
    private func appendText(_ text: String) {
        textPublisher.send(textPublisher.value + text)
    }
    
    private func clearText() {
        textPublisher.send("0")
    }
    
    // 정상적인 계산식이 입력된 상태에서 = 버튼이 눌렸을 때 호출된다. calcaulation service를 통해 계산 수행 > 결과값을 받아 text에 반영한다.
    private func getResultText() {
        let calculationService: CalculationServiceType = CalculationService()
        switch calculationService.calculate(textPublisher.value) {
        case .success(let result):
            textPublisher.send(String(result))
        case .failure(let error):
            print(error.localizedDescription)
            textPublisher.send("Error")
        }
    }
    
    private func replaceLastest(_ text: String) {
        var currentText = textPublisher.value
        currentText.removeLast()
        textPublisher.send(currentText + text)
    }
    
    private func replaceLastTwo(_ text: String) {
        var currentText = textPublisher.value
        currentText.removeLast(2)
        textPublisher.send(currentText + text)
    }
    
    private func updateButtonTapHistory(_ buttonInfo: ButtonInfo) {
        buttonTapHistory.0 = buttonTapHistory.1
        buttonTapHistory.1 = buttonInfo
    }
}

// button role 별 동작 함수
// 버튼 입력을 막는 조건의 경우 log print 외에 아무 동작도 하지 않으며 history update를 하지 않는다. 그 다음 버튼 동작을 판단할 때 유효한 tap history 정보가 필요하기 때문이다.
extension ButtonTapService {
    private func numberButtonTapped(of buttonInfo: ButtonInfo) {
        if textPublisher.value == "0" {
            replaceText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonTapHistory.0?.role == .operation && buttonTapHistory.1?.name == .zero {
            // 연산자 버튼 다음에 0을 눌렀을 때 0을 연속적으로 누를 수 없게 함(ex. 1+00 > 1+0)
            // else 연산자 뒤에 오는 숫자 앞에 0이 오지 않게 함 (ex. 1+01 > 1+1)
            if buttonInfo.name == .zero {
                print("No double zero after operator.")
            } else {
                replaceLastest(buttonInfo.name.title)
                updateButtonTapHistory(buttonInfo)
            }
        } else {
            appendText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        }
    }
    
    // 연산자 버튼 동작 : 숫자와 숫자 사이에는 1개의 연산자만 있어야하므로 누적이 되지 않게 막는 것이 기본적인 전제다.
    private func operationButtonTapped(of buttonInfo: ButtonInfo) {
        if (buttonTapHistory.0?.name == .multiply || buttonTapHistory.0?.name == .divide) && buttonTapHistory.1?.name == .subtract {
            // 눌린 연산자 상태가 *- 또는 /-일 경우 (-가 누적 가능한 건 뒤에 올 숫자를 음수로 인식하기 위함) 새롭게 눌린 연산자 text가 2개를 대신한다. (연산자 한꺼번에 교체 ex. *- > +)
            replaceLastTwo(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonTapHistory.1?.role == .operation && buttonInfo.name != .subtract {
            // 직전에 눌린 버튼이 연산자고 새롭게 눌린 버튼이 -가 아닐 경우 연산자 교체
            replaceLastest(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonInfo.name == .subtract && (textPublisher.value == "0" || buttonTapHistory.1?.name == .add) {
            // - 버튼이 제일 처음으로("0" 상태에서) 눌렸을 때 음수 입력으로 인식하여 "0" text 교체
            // or 직전에 눌린 버튼이 +일 경우, -로 연산자 교체
            replaceLastest(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        } else if buttonInfo.name == .subtract && buttonTapHistory.1?.name == .subtract {
            // - 버튼의 연속 tap 방지
            print("Preventing subtract spam")
        } else {
            appendText(buttonInfo.name.title)
            updateButtonTapHistory(buttonInfo)
        }
    }
    
    private func completerButtonTapped(of buttonInfo: ButtonInfo) {
        if buttonInfo.name == .clear {
            clearText()
            updateButtonTapHistory(buttonInfo)
        } else if buttonTapHistory.1?.role == .operation {
            // 계산식이 완전하지 않은데(숫자로 끝나지 않음 = 직전 버튼 종류가 연산자) = 버튼이 눌렸을 경우 무동작 처리
            print("Nothing happens until formula completed")
        } else {
            // 계산 수행
            getResultText()
            updateButtonTapHistory(buttonInfo)
        }
    }
}
