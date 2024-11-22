# Calculator
![Simulator Screenshot - iPhone 16 Pro - 2024-11-22 at 12 30 36](https://github.com/user-attachments/assets/4eae411b-58ad-4373-b905-4cce8ceb0b45)
## 스파르타코딩클럽 내일배움캠프 iOS 입문 주차 과제 [계산기 앱 만들기]
- 개인 프로젝트 입니다.
- 정수(integer)의 사칙연산 기능만 탑재하고 있습니다.
- storyboard 없는 code base UIKit으로 구현했습니다.
- MVVM 패턴을 적용했습니다.
***
### 개발과정을 담은 포스팅 시리즈
https://velog.io/@emilyj4482/series/CalculatorApp
> 내림차순으로 정렬하면 [iOS 입문 주차] 최신 포스팅을 볼 수 있습니다.
***
### 디렉토리 구성
- EmilysCalculator
  - Helper
    - +Color.swift
    - CustomError.swift
  - Model
    - ButtonInfo.swift
  - Service
    - ButtonTapService.swift
    - CalculationService.swift
  - View
    - MainViewController.swift
    - MainViewModel.swift
    - Subview
      - ScrollView.swift
      - VerticalStackView.swift
      - HorizontalStackView.swift
      - Button.swift
***
### MainViewController.swift
```swift
class MainViewController: UIViewController {
    private lazy var scrollView: ScrollView()
    private lazy var buttonView: VerticalStackView()

    override func viewDidLoad()
    override func viewDidLayoutSubviews()
}
```
> - main view를 그리고, subview를 선언합니다.
> - view model과 소통하며 데이터와 view를 연동합니다.
> - button의 action 함수를 호출합니다.
### MainViewModel.swift
```swift
class MainViewModel {
    let buttons: [ButtonInfo]
    @Published var inputLabelText: String

    private let buttonTapService: ButtonTapService()

    func send(_ buttonInto: ButtonInfo)
    private func bind()
}
```
> - 16개 button의 고유 정보 데이터를 가지며, `MainViewController`가 button을 생성할 때 그 정보를 전달해줍니다.
> - `ButtonTapService`에 의존하여 눌린 버튼에 따라 `inputLabelText`를 업데이트하여 `MainViewController`에 알려줍니다.
> - `MainViewController`로부터 받은 눌린 버튼 정보를 `ButtonTapService`에 전달하여 버튼에 따른 처리를 하도록 합니다.
### ButtonTapService.swift
```swift
protocol ButtonTapServiceType {
    var textPublisher: CurrentValueSubject<String, Never> { get }
    func buttonTapped(of buttonInfo: ButtonInfo)
}

class ButtonTapService: ButtonTapServiceType {
    private var buttonTapHistory: (ButtonInfo?, ButtonInfo?)

    private func numberButtonTapped(of buttonInfo: ButtonInfo)
    private func operationButtonTapped(of buttonInfo: ButtonInfo)
    private func completerButtonTapped(of buttonInfo: ButtonInfo)
}
```
> - button 종류에 따른 동작을 나누어 수행합니다.
> - 전에 눌린 button의 history와 현재 눌린 버튼을 고려하여 처리합니다.
> - 처리 결과는 `textPublisher`에 반영되며, `MainViewModel`에 전달됩니다.
> - `MainViewModel`로부터 눌린 버튼의 정보를 전달 받습니다.
> - 정상적인 계산식이 완성된 뒤 `=` 버튼이 눌렸을 때 `CalculationService`를 이용하여 계산을 수행한 뒤 결과를 배출합니다.
### CalculationService.swift
```swift
protocol CalculationServiceType {
    func calculate(_ text: String) -> Result<Int, CustomError>
}

class CalculationService: CalculationServiceType { }
```
> - `ButtonTapService`에서 특정 조건이 충족되었을 때 호출되어 계산 기능을 수행합니다.
> - 계산 결과를 `Result`로 반환합니다. 계산이 성공했을 경우 `Int` 결과값, 실패했을 경우 `CustomError`를 반환합니다.
### ButtonInfo.swift
```swift
struct ButtonInfo {
    let role: ButtonRole
    let name: ButtonName
}

enum ButtonRole {
    case number, operation, completer
}

enum ButtonName {
    case one, two ..., add, subtract, ..., clear, equal

    var title: String
    var systemName: String
    var withImage: Bool
}
```
> - `Button`의 프로퍼티로 선언되어 버튼이 고유 정보를 갖게 할 값 타입입니다.
> - `role` : 숫자 버튼은 `number`, 사칙 연산자는 `operation`, `AC` 버튼과 `=` 버튼은 `completer` 입니다.
> - `name` : 어떤 버튼인지 버튼 고유 정보를 구분할 프로퍼티 입니다.
> - `ButtonRole` 정보는 종류에 따라 버튼 동작을 분기할 때 사용됩니다.
> - `ButtonName` enum의 프로퍼티는 `Button` 클래스 내에서 ui를 구성할 때 쓰입니다.
### Subview
```swift
class ScrollView: UIScrollView {
    lazy var inputLabel: UILabel
}

class VerticalStackView: UIStackView {
    func addSubviews(_ hStacks: [HorizontalStackView])
}

class HorizontalStackView: UIStackView {
    func addSubviews(_ buttons: [Button])
}

class Button: UIButton {
    let buttonInfo: ButtonInfo
}
```
> - `ScrollView`는 main view의 subview로, 계산 과정과 결과를 표시하는 `inputLabel`을 포함하고 있습니다.
> - `VerticalStackView`는 main view의 subview로, 4개의 `HorizontalStackView`를 subview로 갖습니다.
> - `HorizontalStackView`는 4개의 `Button`을 subview로 갖습니다.
### CustomError.swift
```swift
enum CustomError: Error {
    case convertingFailed
    case dividedByZero
    
    var localizedDescription: String
}
```
> 앱 기준에서 error로 규정해야 하는 상황이 발생하면 에러 선언을 하기 위해 사용됩니다.
### +Color.swift
```swift
extension UIColor {
    static let numbersButtonColor
    static let operatorButtonColor
}
```
> `Button`에서 버튼 종류에 따라 다른 배경색을 적용할 때 편하게 호출하여 쓸 수 있도록 `UIColor`를 확장 구현하였습니다.
