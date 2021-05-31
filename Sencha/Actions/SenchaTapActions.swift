import Foundation
import KIF

public protocol SenchaTapActions: EarlGreyHumanizer {
    func tap(_ matcher: Matcher, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaTapActions {
    public func tap(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        tester().tap(nil, in: findView(with: matcher))
    }
}
