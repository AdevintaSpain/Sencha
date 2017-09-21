import Foundation
import EarlGrey

public protocol SenchaTapActions: EarlGreyHumanizer {
    
    func tap(_ matcher: Matcher, file: StaticString, line: UInt)
    func tapBackButton(file: StaticString, line: UInt)
}

public extension SenchaTapActions {
        
    func tap(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }

    public func tapBackButton(file: StaticString = #file, line: UInt = #line) {

        select(
            .class(NSClassFromString("_UIBackButtonContainerView")!),
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }
}
