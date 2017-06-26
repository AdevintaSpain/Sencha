
import Foundation
import EarlGrey

protocol MatchaTableViewActions: EarlGreyHumanizer, MatchaScrollViewActions {
    
    func tapCell(with matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
}

extension MatchaTableViewActions {
    
    func tapCell(with matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        scrollToElementWith(
            matcher,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }
}
