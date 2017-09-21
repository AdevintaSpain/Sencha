
import Foundation
import EarlGrey

public protocol SenchaAssertion: EarlGreyHumanizer {
    
    func assertVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertEnabled(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertDisabled(_ matcher: Matcher, file: StaticString, line: UInt)
}

public extension SenchaAssertion {
    
    func assertVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            .visible
        )
    }

    func assertNotVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            .notVisible
        )
    }
    
    func assertEnabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            .enabled
        )
    }
    
    func assertDisabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            .not(.enabled)
        )
    }
}
