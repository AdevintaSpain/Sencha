import Foundation
import EarlGrey

public protocol SenchaEditTextActions: EarlGreyHumanizer {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
    func insertText(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
    func clearTextInElement(with matcher: Matcher, file: StaticString, line: UInt)
}

public extension SenchaEditTextActions {

    func insertText(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {

        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_replaceText(text)
        )
    }

    func type(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_typeText(text)
        )
    }
    
    func clearTextInElement(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_clearText()
        )
    }
}
