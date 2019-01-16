import Foundation
import EarlGrey

public protocol SenchaScrollableAssertion: SenchaAssertion, SenchaScrollViewActions {
    
    func assertVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
    
}

public extension SenchaScrollableAssertion {
    
    func assertVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        scrollTo(
            .allOf([matcher, .visible]),
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).assert(
            .visible
        )
    }
    
    func assertNotVisible(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        scrollTo(
            matcher,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).assert(
            .allOf([matcher, .notVisible])
        )
    }
}
