import Foundation
import EarlGrey

public protocol SenchaSliderAssertions: EarlGreyHumanizer {
    func assertSlider(_ sliderMatcher: Matcher, hasValue valueMatcher: ValueMatcher, file: StaticString, line: UInt)
}

public extension SenchaSliderAssertions {

    func assertSlider(_ sliderMatcher: Matcher, hasValue valueMatcher: ValueMatcher, file: StaticString = #file, line: UInt = #line) {

        select(
            sliderMatcher,
            file: file,
            line: line
        ).assert(
            .sliderValue(valueMatcher)
        )
    }
}
