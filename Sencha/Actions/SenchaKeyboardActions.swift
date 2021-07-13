import UIKit
import Foundation
import KIF

public protocol SenchaKeyboardActions: EarlGreyHumanizer {
    
    func tapKeyboardReturnKey(file: StaticString, line: UInt)
}

extension XCTestCase: SenchaKeyboardActions {
    public func tapKeyboardReturnKey(file: StaticString = #file, line: UInt = #line) {
        let newLineCharacter = "\n"
        tester().enterText(intoCurrentFirstResponder: newLineCharacter)
    }
}
