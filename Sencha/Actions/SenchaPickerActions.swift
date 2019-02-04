import Foundation
import EarlGrey

public protocol SenchaPickerActions: EarlGreyHumanizer {

    func movePicker(_ pickerMatcher: Matcher, to date: Date, file: StaticString, line: UInt)
    func movePicker(_ pickerMatcher: Matcher, column: Int, to value: String, file: StaticString, line: UInt)
}

public extension SenchaPickerActions {

    func movePicker(_ pickerMatcher: Matcher, to date: Date, file: StaticString = #file, line: UInt = #line) {
        select(
            pickerMatcher,
            file: file,
            line: line
        ).perform(
            .setPickerDateTo(date)
        )
    }

    func movePicker(_ pickerMatcher: Matcher, column: Int, to value: String, file: StaticString = #file, line: UInt = #line) {
        select(
            pickerMatcher,
            file: file,
            line: line
        ).perform(
            .setPickerColumnToValue(column, value)
        )
    }
}
