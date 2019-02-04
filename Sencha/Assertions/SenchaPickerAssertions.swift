import Foundation
import EarlGrey

public protocol SenchaPickerAssertions: EarlGreyHumanizer {
    func assertPicker(_ pickerMatcher: Matcher, hasValue value: Date, file: StaticString, line: UInt)
    func assertPicker(_ pickerMatcher: Matcher, hasValue value: String, inColumn column: Int, file: StaticString, line: UInt)
}

public extension SenchaPickerAssertions {

    func assertPicker(_ pickerMatcher: Matcher, hasValue value: Date, file: StaticString = #file, line: UInt = #line) {

        select(
            pickerMatcher,
            file: file,
            line: line
        ).assert(
            .datePickerValue(value)
        )
    }

    func assertPicker(_ pickerMatcher: Matcher, hasValue value: String, inColumn column: Int, file: StaticString = #file, line: UInt = #line) {

        select(
            pickerMatcher,
            file: file,
            line: line
        ).assert(
            .pickerColumnValue(column, value)
        )
    }
}
