import XCTest
import KIF

public protocol SenchaPickerActions {
    func movePicker(_ matcher: Matcher, to date: Date, file: StaticString, line: UInt)
    func movePicker(_ matcher: Matcher, column: Int, to value: String, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaPickerActions {

    public func movePicker(_ matcher: Matcher, to date: Date, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let picker = view as? UIDatePicker else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotADatePicker, view), file: file, line: line)
            return
        }
        picker.setDate(date, animated: true)
    }

    public func movePicker(_ matcher: Matcher, column: Int, to value: String, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let picker = view as? UIPickerView else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotAPicker, view), file: file, line: line)
            return
        }
        tester().selectPickerViewRow(
            withTitle: value,
            inComponent: column,
            fromPicker: picker,
            with: .forwardFromStart
        )
    }
}
