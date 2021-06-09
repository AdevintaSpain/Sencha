import Foundation
import KIF

public protocol SenchaEditTextActions: EarlGreyHumanizer {
    
    func type(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
    func insertText(text: String, inElementWith matcher: Matcher, file: StaticString, line: UInt)
    func clearTextInElement(with matcher: Matcher, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaEditTextActions {

    public func type(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        tester().enterText(text, into: nil, in: findView(with: matcher), expectedResult: nil)
    }

    public func insertText(text: String, inElementWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let textId):
            tester().setText(text, intoViewWithAccessibilityLabel: textId)
        case .accessibilityLabel(let label):
            tester().setText(text, intoViewWithAccessibilityLabel: label)
        default:
            unsupportedTest(file: file, line: line)
        }
    }

    public func clearTextInElement(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        tester().clearText(from: nil, in: findView(with: matcher))
    }

}