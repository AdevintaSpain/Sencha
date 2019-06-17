
import Foundation
import EarlGrey

public protocol SenchaAssertion: EarlGreyHumanizer {
    
    func assertVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertEnabled(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertDisabled(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertVisible(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString, line: UInt)
    func assertEnabled(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString, line: UInt)
    func assertDisabled(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString, line: UInt)
}

public extension SenchaAssertion {

    func assertVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.visible, matcher: matcher, file: file, line: line)
    }

    func assertNotVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.notVisible, matcher: matcher, file: file, line: line)
    }

    func assertEnabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.enabled, matcher: matcher, file: file, line: line)
    }

    func assertDisabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.not(.enabled), matcher: matcher, file: file, line: line)
    }
    
    func assertVisible(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.visible, matcher: matcher, inParent: parentMatcher, file: file, line: line)
    }

    func assertNotVisible(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.notVisible, matcher: matcher, inParent: parentMatcher, file: file, line: line)
    }
    
    func assertEnabled(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.enabled, matcher: matcher, inParent: parentMatcher, file: file, line: line)
    }
    
    func assertDisabled(_ matcher: Matcher, inParent parentMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(.not(.enabled), matcher: matcher, inParent: parentMatcher, file: file, line: line)
    }

    private func assert(_ assertion: Matcher, matcher: Matcher, inParent parentMatcher: Matcher? = nil, file: StaticString = #file, line: UInt = #line) {
        let interaction = select(matcher, file: file, line: line)
        guard let parentMatcher = parentMatcher else {
            interaction.assert(assertion)
            return
        }
        interaction.inRoot(
                parentMatcher.greyMatcher()
        ).assert(
                assertion
        )
    }
}
