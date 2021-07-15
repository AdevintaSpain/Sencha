import Foundation
import KIF

public protocol SenchaScrollViewActions {
    func scroll(to edge: ScrollEdge, in matcher: Matcher, file: StaticString, line: UInt)
}

public enum ScrollEdge {
    case top, bottom, left, right
}

extension SenchaErrorMessage {
    static let viewIsNotScrollable = "%@ is not scrollable."
}

extension XCTestCase: SenchaScrollViewActions {
    
    public func scroll(to edge: ScrollEdge, in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher)
        guard let scrollView = view as? UIScrollView else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotScrollable, view), file: file, line: line)
            return
        }
        var scrollOffset: CGPoint = scrollView.contentOffset
        switch edge {
        case .top:
            scrollOffset.y = -scrollView.contentInset.top
        case .bottom:
            scrollOffset.y = scrollView.contentSize.height - scrollView.bounds.height + scrollView.contentInset.bottom
        case .left:
            scrollOffset.x = -scrollView.contentInset.left
        case .right:
            scrollOffset.x = scrollView.contentSize.width - scrollView.bounds.width + scrollView.contentInset.right
        }
        scrollView.setContentOffset(scrollOffset, animated: true)
    }
}
