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

    func tapBackButton(file: StaticString = #file, line: UInt = #line) {
        var backButtonMatcher: Matcher
        if #available(iOS 14, *) {
            backButtonMatcher = .allOf([.descendant(.class(NSClassFromString("_UINavigationBarContentView")!)), .firstElement])
        } else {
            backButtonMatcher = .class(NSClassFromString("_UIBackButtonContainerView")!)
        }
        select(
            backButtonMatcher,
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }
}
