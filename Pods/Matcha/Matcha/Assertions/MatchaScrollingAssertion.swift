
import Foundation
import EarlGrey

public protocol MatchaScrollableAssertion: MatchaAssertion, MatchaScrollViewActions {
    
    func assertVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
    
}

public extension MatchaScrollableAssertion {
    
    func assertVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        scrollTo(
            matcher,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).assert(
            Matcher.visible.greyMatcher()
        )
    }
    
    func assertNotVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        scrollTo(
            matcher,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).assert(
            Matcher.allOf([matcher, Matcher.notVisible]).greyMatcher()
        )
    }
}
