
import Foundation
import EarlGrey

protocol MatchaScrollableAssertion: MatchaAssertion, MatchaScrollViewActions {
    
    func assertVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
}

extension MatchaScrollableAssertion {
    
    func assertVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        scrollToElementWith(
            matcher,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).assert(
            Matcher.visible.greyMatcher()
        )
    }
}
