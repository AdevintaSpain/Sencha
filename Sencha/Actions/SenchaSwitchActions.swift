import Foundation
import KIF

public protocol SenchaSwitchActions {
    func setSwitch(with matcher: Matcher, toOn: Bool, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaSwitchActions {
    public func setSwitch(with matcher: Matcher, toOn: Bool, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let text):
            tester().setOn(toOn, forSwitchWithAccessibilityLabel: text)
        case .accessibilityLabel(let label):
            tester().setOn(toOn, forSwitchWithAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().setOn(toOn, forSwitchWithAccessibilityIdentifier: accessibilityID)
        default:
            unsupportedTest(file: file, line: line)
        }
    }
}
