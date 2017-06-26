
import UIKit
import Foundation
import EarlGrey

protocol MatchaKeyboardActions: EarlGreyHumanizer {
    
    func tapKeyboardReturnKey(file: StaticString, line: UInt)
}

extension MatchaKeyboardActions {
    
    func tapKeyboardReturnKey(file: StaticString = #file, line: UInt = #line) {
        
        let matchers = Matcher.allOf(
            [
                Matcher.firstResponder,
                Matcher.class(UITextField.self)
            ]
        )
        let newLineCharacter = "\n"

        self.strictSelect(
            matcher: matchers, file: file, line: line
        ).perform(
            grey_typeText(newLineCharacter)
        )
    }
}
