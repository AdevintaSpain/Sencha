
import Foundation
import EarlGrey

protocol MatchaEditTextActions: EarlGreyHumanizer {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
}

extension MatchaEditTextActions {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        strictSelect(
            matcher: matcher,
            file: file,
            line: line
        ).perform(
            grey_replaceText(text)
        )
    }
}
