import XCTest

public protocol SenchaAssertEnabled {
    func assertEnabled(_ matcher: Matcher, file: StaticString, line: UInt)
    func assertDisabled(_ matcher: Matcher, file: StaticString, line: UInt)
}

extension SenchaErrorMessage {
    static let viewIsEnabled = "View is enabled"
    static let viewIsNotEnabled = "View is not enabled"
}

extension XCTestCase: SenchaAssertEnabled {

    public func assertEnabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        validate(enabled: true, view: view, file: file, line: line)
    }

    public func assertDisabled(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        validate(enabled: false, view: view, file: file, line: line)
    }

    private func validate(enabled: Bool, view: UIView, file: StaticString = #file, line: UInt = #line) {
        let errorMessage = enabled ? SenchaErrorMessage.viewIsNotEnabled : SenchaErrorMessage.viewIsEnabled
        if let control = view as? UIControl {
            XCTAssertEqual(control.isEnabled, enabled, errorMessage, file: file, line: line)
        } else {
            XCTAssertEqual(view.isUserInteractionEnabled, enabled, errorMessage, file: file, line: line)
        }
    }
}
