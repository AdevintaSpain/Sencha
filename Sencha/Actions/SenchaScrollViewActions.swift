import Foundation
import KIF

public protocol SenchaScrollViewActions: EarlGreyHumanizer {
    func scrollToBottom(in matcher: Matcher, file: StaticString, line: UInt)
    func scrollToTop(in matcher: Matcher, file: StaticString, line: UInt)
    func scrollToLeft(in matcher: Matcher, file: StaticString, line: UInt)
    func scrollToRight(in matcher: Matcher, file: StaticString, line: UInt)
}

enum ScrollEdge {
    case top, bottom, left, right
}
extension XCTestCase: SenchaScrollViewActions {
    public func scrollToBottom(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
    }

    public func scrollToTop(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
    }

    public func scrollToLeft(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
    }

    public func scrollToRight(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
    }

    private func scroll(to edge: ScrollEdge, in matcher: Matcher) {

    }
}
