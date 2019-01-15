import Foundation
import EarlGrey

public protocol SenchaEditTextActions: EarlGreyHumanizer {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
}

public extension SenchaEditTextActions {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_typeText(text)
        )
    }
}
