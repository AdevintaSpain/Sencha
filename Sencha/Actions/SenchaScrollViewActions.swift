import Foundation
import EarlGrey

public protocol SenchaScrollViewActions: EarlGreyHumanizer {
    
    func tap(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
    @discardableResult func scrollTo(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString, line: UInt) -> GREYInteraction
    @discardableResult func scrollTo(_ matcher: Matcher, withSwipesOf distance: CGFloat, inElementWith scrollMatcher: Matcher, file: StaticString, line: UInt) -> GREYInteraction
    func scrollToBottom(in matcher: Matcher, file: StaticString, line: UInt)
    func scrollToTop(in matcher: Matcher, file: StaticString, line: UInt)
    func scrollToLeft(in matcher: Matcher, file: StaticString, line: UInt)
    func scrollToRight(in matcher: Matcher, file: StaticString, line: UInt)
}

public extension SenchaScrollViewActions {
    
    func tap(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        let visibleMatcher = Matcher.allOf([matcher, .visible])
        scrollTo(
            visibleMatcher,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }

    func scrollToBottom(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        scroll(to: .bottom, in: matcher)
    }

    func scrollToTop(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        scroll(to: .top, in: matcher)
    }

    func scrollToLeft(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        scroll(to: .left, in: matcher)
    }

    func scrollToRight(in matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        scroll(to: .right, in: matcher)
    }

    private func scroll(to edge: GREYContentEdge, in matcher: Matcher) {
        EarlGrey.selectElement(with: matcher.greyMatcher()).perform(grey_scrollToContentEdge(edge))
    }

    @discardableResult func scrollTo(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYInteraction {
        
        let halfScreenSize = UIScreen.main.bounds.height/2
        return scrollTo(
            matcher,
            withSwipesOf: halfScreenSize,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        )
    }
    
    @discardableResult func scrollTo(_ matcher: Matcher, withSwipesOf distance: CGFloat, inElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYInteraction {
        
        return select(
            matcher,
            file: file,
            line: line
        ).usingSearch(
            grey_scrollInDirection(GREYDirection.down, CGFloat(distance)),
            onElementWith: scrollMatcher.greyMatcher()
        )
    }
}
