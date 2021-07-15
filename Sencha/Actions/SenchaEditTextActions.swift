import KIF

public protocol SenchaEditTextActions {
    func type(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
    func insertText(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
    func clearTextInElement(with matcher: Matcher, file: StaticString, line: UInt)
    func clearAndEnterTextInElement(text: String, with matcher: Matcher, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaEditTextActions {

    public func type(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {

        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().enterText(text, intoViewWithAccessibilityLabel: label)
        case .accessibilityID(_):
            tester().enterText(text, into: nil, in: findView(with: matcher), expectedResult: text)
        }
    }

    public func insertText(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().setText(text, intoViewWithAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().setText(text, intoViewWithAccessibilityIdentifier: accessibilityID)
        }
    }

    public func clearTextInElement(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        tester().clearText(from: nil, in: findView(with: matcher))
    }

    public func clearAndEnterTextInElement(text: String, with matcher: Matcher, file: StaticString, line: UInt) {
        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().clearText(fromAndThenEnterText: text, intoViewWithAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().clearText(fromAndThenEnterText: text, intoViewWithAccessibilityIdentifier: accessibilityID)
        }
    }

}
