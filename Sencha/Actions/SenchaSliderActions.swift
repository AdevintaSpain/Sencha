import Foundation
import EarlGrey

public protocol SenchaSliderActions: EarlGreyHumanizer {

    func moveSlider(_ sliderMatcher: Matcher, to value: Double, file: StaticString, line: UInt)
}

public extension SenchaSliderActions {

    func moveSlider(_ sliderMatcher: Matcher, to value: Double, file: StaticString = #file, line: UInt = #line) {
        select(
            sliderMatcher,
            file: file,
            line: line
        ).perform(
            .moveSliderToValue(value)
        )
    }
}
