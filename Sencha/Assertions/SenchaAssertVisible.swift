import XCTest

public protocol SenchaAssertVisible {
    func assertVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertNotVisible(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertTextVisible(_ text: String, inTextFieldWith matcher: Matcher, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaAssertVisible {

    public func assertNotVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().waitForAbsenceOfView(withAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().waitForAbsenceOfView(withAccessibilityIdentifier: accessibilityID)
        }
    }

    public func assertVisible(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        _ = findView(with: matcher, file: file, line: line)
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
        case .text(let label), .accessibilityLabel(let label):
            view = tester().waitForView(withAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            view = tester().waitForView(withAccessibilityIdentifier: accessibilityID)
        }
        XCTAssertEqual(tester().text(from: view)!, text, file: file, line: line)
    }
}
