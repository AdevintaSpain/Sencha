import XCTest

public protocol SenchaSwitchActions {
    func setSwitch(with matcher: Matcher, toOn: Bool, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaSwitchActions {
    
    public func setSwitch(with matcher: Matcher, toOn: Bool, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().setOn(toOn, forSwitchWithAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().setOn(toOn, forSwitchWithAccessibilityIdentifier: accessibilityID)
        }
    }
}
