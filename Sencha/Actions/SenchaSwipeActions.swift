import Foundation
import EarlGrey

public protocol SenchaSwipeActions: EarlGreyHumanizer {

    func swipe()
}

public extension SenchaSwipeActions {

    func swipe(_ matcher: Matcher, inDirection direction: SenchaDirection,file: StaticString = #file, line: UInt = #line) {

        let direction = GREYDirection(rawValue: direction.rawValue) ?? .left
        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_swipeFastInDirection(direction)
        )
    }
}

public enum SenchaDirection: Int {
    case left = 1
    case right
    case up
    case down
}
