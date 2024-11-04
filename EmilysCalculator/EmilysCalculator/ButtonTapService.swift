//
//  ButtonTapService.swift
//  EmilysCalculator
//
//  Created by EMILY on 31/10/2024.
//

import UIKit
import Combine

class ButtonTapService {
    
    var testHandler: (ButtonInfo) -> Void = {
        print($0.name.title)
    }
    
    func testAction(_ buttonInfo: ButtonInfo) -> UIAction {
        return UIAction(handler: { [weak self] _ in
            self?.testHandler(buttonInfo)
        })
    }
    
}
