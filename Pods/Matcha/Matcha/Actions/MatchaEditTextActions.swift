
import Foundation
import EarlGrey

public protocol MatchaEditTextActions: EarlGreyHumanizer {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
}

public extension MatchaEditTextActions {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher: matcher,
            file: file,
            line: line
        ).perform(
            grey_replaceText(text)
        )
    }
}
