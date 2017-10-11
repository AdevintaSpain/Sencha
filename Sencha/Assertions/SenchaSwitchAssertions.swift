
import EarlGrey

public protocol SenchaSwitchAssertions: EarlGreyHumanizer {
     func assertSwitchIsOn(_ matcher: Matcher, file: StaticString, line: UInt)
     func assertSwitchIsOff(_ matcher: Matcher, file: StaticString, line: UInt)
}

public extension SenchaSwitchAssertions {

    func assertSwitchIsOn(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            .switchOn
        )
    }

    func assertSwitchIsOff(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            .not(.switchOn)
        )
    }
}

