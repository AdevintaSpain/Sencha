import XCTest

public protocol SenchaSwitchAssertions: EarlGreyHumanizer {
     func assertSwitchIsOn(_ matcher: Matcher, file: StaticString, line: UInt)
     func assertSwitchIsOff(_ matcher: Matcher, file: StaticString, line: UInt)
}

extension SenchaErrorMessage {
    static let viewIsNotASwitch = "%@ is not a Switch."
}

extension XCTestCase: SenchaSwitchAssertions {

    public func assertSwitchIsOn(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let aSwitch = view as? UISwitch else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotASwitch, view), file: file, line: line)
            return
        }
        XCTAssertTrue(aSwitch.isOn)
    }

    public func assertSwitchIsOff(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let aSwitch = view as? UISwitch else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotASwitch, view), file: file, line: line)
            return
        }
        XCTAssertFalse(aSwitch.isOn)
    }
}

