import Foundation
import EarlGrey

public protocol SenchaTableViewActions: EarlGreyHumanizer {
    func pullToRefresh(tableViewWith matcher: Matcher, file: StaticString, line: UInt)
}

public extension SenchaTableViewActions {
    func pullToRefresh(tableViewWith matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        select(
            matcher,
            file: file,
            line: line
            ).perform(
                grey_swipeSlowInDirectionWithStartPoint(.down, 0.7, 0.7)
        )
    }
}
