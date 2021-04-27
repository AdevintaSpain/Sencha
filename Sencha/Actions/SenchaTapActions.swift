import Foundation
import KIF

public protocol SenchaTapActions: EarlGreyHumanizer {
    func tap(_ matcher: Matcher, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaTapActions {
    public func tap(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let text):
            tester().tapView(withAccessibilityLabel: text)
        case .accessibilityLabel(let label):
            tester().tapView(withAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().tapView(withAccessibilityIdentifier: accessibilityID)
        default:
            unsupportedTest(file: file, line: line)
        }
    }
}
