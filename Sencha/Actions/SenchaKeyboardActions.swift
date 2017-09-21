import UIKit
import Foundation
import EarlGrey

public protocol SenchaKeyboardActions: EarlGreyHumanizer {
    
    func tapKeyboardReturnKey(file: StaticString, line: UInt)
}

public extension SenchaKeyboardActions {
    
    func tapKeyboardReturnKey(file: StaticString = #file, line: UInt = #line) {
        
        let matchers: Matcher = .allOf(
            [
                .firstResponder,
                .class(UITextField.self)
            ]
        )
        let newLineCharacter = "\n"

        select(
            matchers, file: file, line: line
        ).perform(
            grey_typeText(newLineCharacter)
        )
    }
}
