
import Foundation
import EarlGrey

protocol MatchaScrollViewActions: EarlGreyHumanizer {
    
    @discardableResult func scrollToElementWith(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString, line: UInt) -> GREYElementInteraction
}

extension MatchaScrollViewActions {
    
    @discardableResult func scrollToElementWith(_ matcher: Matcher, inElementWith scrollMatcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYElementInteraction {
        
        let halfScreenSize = UIScreen.main.bounds.height/2
        return strictSelect(
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
