import XCTest
import KIF

public enum SenchaDirection {
    case left
    case right
    case up
    case down

    var kifDirection: KIFSwipeDirection {
        switch self {
        case .left:
            return .left
        case .right:
            return .right
        case .up:
            return .up
        case .down:
            return .down
        }
    }
}

public protocol SenchaSwipeActions: EarlGreyHumanizer {
    func swipe(_ matcher: Matcher, inDirection direction: SenchaDirection, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaSwipeActions {

    public func swipe(_ matcher: Matcher, inDirection direction: SenchaDirection,file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().swipeView(withAccessibilityLabel: label, in: direction.kifDirection)
        case .accessibilityID(let accessibilityID):
            tester().swipeView(withAccessibilityIdentifier: accessibilityID, in: direction.kifDirection)
        default:
            unsupportedTest(file: file, line: line)
        }
    }
}
