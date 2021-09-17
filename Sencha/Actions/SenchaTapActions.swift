import XCTest

public protocol SenchaTapActions {
    func tap(_ matcher: Matcher, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaTapActions {
    public func tap(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().tapView(withAccessibilityLabel: label)
        case .accessibilityID(let identifier):
            tester().tapView(withAccessibilityIdentifier: identifier)
        }
    }
}
