
import Foundation
import EarlGrey

public protocol MatchaTapActions: EarlGreyHumanizer {
    
    func tap(_ matcher: Matcher, file: StaticString, line: UInt)
}

public extension MatchaTapActions {
        
    func tap(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        select(
            matcher,
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }
}
