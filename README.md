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

