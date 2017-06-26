
import Foundation
import EarlGrey

protocol MatchaAssertion: EarlGreyHumanizer {
    
    func assertVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, file: StaticString, line: UInt)
}

extension MatchaAssertion {
    
    func assertVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            firstElementMatching: matcher,
            file: file,
            line: line
        ).assert(
            Matcher.visible.greyMatcher()
        )
    }

    func assertNotVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        simpleSelect(
            matcher: matcher,
            file: file,
            line: line
        ).assert(
            Matcher.notVisible.greyMatcher()
        )
    }
}
