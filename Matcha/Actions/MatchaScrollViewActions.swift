
import Foundation
import EarlGrey

public protocol MatchaScrollViewActions: EarlGreyHumanizer {
    
    func tap(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString, line: UInt)
    @discardableResult func scrollTo(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString, line: UInt) -> GREYElementInteraction
}

public extension MatchaScrollViewActions {
    
    func tap(_ matcher: Matcher, inScrollableElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        scrollTo(
            matcher,
            inElementWith: scrollMatcher,
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }
    
    @discardableResult func scrollTo(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYElementInteraction {
        
        let halfScreenSize = UIScreen.main.bounds.height/2
        return select(
            matcher: matcher,
            file: file,
            line: line
        ).usingSearch(
            grey_scrollInDirection(GREYDirection.down, halfScreenSize),
            onElementWith: grey_allOf([
                    scrollMatcher.greyMatcher(),
                    Matcher.visible.greyMatcher()
                ]
            )
        )
    }
}
