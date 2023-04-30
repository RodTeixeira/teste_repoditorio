//
//  SpeechForeignWordAccessibility.swift
//  teste_acessibilidade
//
//  Created by Rodolfo on 15/02/23.
//

import Foundation

public struct SpeechLanguage {
    var values: [String]
    var accSpeechLanguage: String
    
    public init(values: [String], accSpeechLanguage: String) {
        self.values = values
        self.accSpeechLanguage = accSpeechLanguage
    }
    
}


public class SpeechForeignWordAccessibility {
    
    private var accValueLowercase: String
    private var mutableString: NSMutableAttributedString
    private var foreignWords: [SpeechLanguage] = []
    
    public init(accValueLowercase: String, foreignWords: [SpeechLanguage]) {
        self.accValueLowercase = accValueLowercase
        self.foreignWords = foreignWords
        self.mutableString = NSMutableAttributedString(string: accValueLowercase)
    }
    
    public func mutableStringSpeechingForeignWord() -> NSMutableAttributedString {
        foreignWords.forEach { foreignWord in
            foreignWord.values.forEach { word in
                if let nsRange = accValueLowercase.range(of: word)?.nsRange(in: accValueLowercase) {
                    let attributedString = NSMutableAttributedString(string: word, attributes: [NSAttributedString.Key.accessibilitySpeechLanguage: foreignWord.accSpeechLanguage])
                    mutableString.replaceCharacters(in: nsRange, with: attributedString)
                }
            }
        }
        return mutableString
    }
}

public extension RangeExpression where Bound == String.Index {
    func nsRange<S: StringProtocol>(in string: S) -> NSRange { .init(self, in: string)}
}
