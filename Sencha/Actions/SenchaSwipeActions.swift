import Foundation
import EarlGrey

public protocol SenchaSwipeActions: EarlGreyHumanizer {

    func swipe(_ matcher: Matcher, inDirection direction: SenchaDirection,file: StaticString, line: UInt)
}

public extension SenchaSwipeActions {

    func swipe(_ matcher: Matcher, inDirection direction: SenchaDirection,file: StaticString = #file, line: UInt = #line) {

        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_swipeSlowInDirection(direction.toGREYDirection())
        )
    }
}

public enum SenchaDirection {
    case left
    case right
    case up
    case down

    func toGREYDirection() -> GREYDirection {
        switch self {
        case .left: return .left
        case .right: return .right
        case .down: return .down
        case .up: return .up
        }
    }
}
