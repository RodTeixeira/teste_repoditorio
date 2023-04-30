//
//  UIViewExtensions.swift
//  teste_acessibilidade
//
//  Created by Rodolfo on 15/02/23.
//

import Foundation
import UIKit

extension UIView {
    func setAcessibilityValueWithForeignSpeech(value: String?) {
        if let accessibilityValue = value {
            let foreignWords = [SpeechLanguage(values: ["Avenue", "core"], accSpeechLanguage: "en-US")]
            let helper = SpeechForeignWordAccessibility(accValueLowercase: accessibilityValue, foreignWords: foreignWords)
            setValue(helper.mutableStringSpeechingForeignWord(), forKey: "accessibilityLabel")
        }
    }
}
