import Foundation
import EarlGrey

public protocol SenchaScrollViewActions: EarlGreyHumanizer {
    
    func tap(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
    @discardableResult func scrollTo(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString, line: UInt) -> GREYElementInteraction
    @discardableResult func scrollTo(_ matcher: Matcher, withSwipesOf distance: CGFloat, inElementWith scrollMatcher: Matcher, file: StaticString, line: UInt) -> GREYElementInteraction
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
    
    @discardableResult func scrollTo(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYElementInteraction {
        
        let halfScreenSize = UIScreen.main.bounds.height/2
        return scrollTo(
            matcher,
            withSwipesOf: halfScreenSize,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        )
    }
    
    @discardableResult func scrollTo(_ matcher: Matcher, withSwipesOf distance: CGFloat, inElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYElementInteraction {
        
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
