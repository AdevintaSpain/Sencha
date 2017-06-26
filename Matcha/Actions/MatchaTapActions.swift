
import Foundation
import EarlGrey

protocol MatchaTapActions: EarlGreyHumanizer {
    
    func tap(_ matcher: Matcher, file: StaticString, line: UInt)
}

extension MatchaTapActions {
        
    func tap(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        
        strictSelect(
            matcher: matcher,
            file: file,
            line: line
        ).perform(
            grey_tap()
        )
    }
}
