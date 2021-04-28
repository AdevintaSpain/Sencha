import Foundation
import KIF
import XCTest

public protocol SenchaAssertion {
    
    func assertVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertEnabled(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertDisabled(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertTextVisible(_ text: String, inTextFieldWith matcher: Matcher, file: StaticString, line: UInt)
}

extension SenchaErrorMessage {
    static let viewIsEnabled = "View is enabled"
    static let viewIsNotEnabled = "View is not enabled"
}

extension XCTestCase: SenchaAssertion {

    public func assertNotVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let text):
            tester().waitForAbsenceOfView(withAccessibilityLabel: text)
        case .accessibilityLabel(let label):
            tester().waitForAbsenceOfView(withAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().waitForAbsenceOfView(withAccessibilityIdentifier: accessibilityID)
        default:
            unsupportedTest(file: file, line: line)
        }
    }

    public func assertVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        _ = findView(with: matcher, file: file, line: line)
    }

    public func assertEnabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        validate(enabled: true, view: view)
    }

    public func assertDisabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        validate(enabled: false, view: view)
    }

    private func validate(enabled: Bool, view: UIView, file: StaticString = #file, line: UInt = #line) {
        let errorMessage = enabled ? SenchaErrorMessage.viewIsNotEnabled : SenchaErrorMessage.viewIsEnabled
        if let control = view as? UIControl {
            XCTAssertEqual(control.isEnabled, enabled, errorMessage, file: file, line: line)
        } else {
            XCTAssertEqual(view.isUserInteractionEnabled, enabled, errorMessage, file: file, line: line)
        }
    }

    public func assertTextVisible(_ text: String, inTextFieldWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        var view: UIView!
        switch matcher {
        case .accessibilityLabel(let label):
            view = tester().waitForView(withAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            view = tester().waitForView(withAccessibilityIdentifier: accessibilityID)
        default:
            unsupportedTest(file: file, line: line)
        }
        XCTAssertEqual(tester().text(from: view)!, text, file: file, line: line)
    }
}
