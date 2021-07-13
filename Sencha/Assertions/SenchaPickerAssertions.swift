import XCTest

public protocol SenchaPickerAssertions: EarlGreyHumanizer {
    func assertPicker(_ matcher: Matcher, hasValue value: Date, file: StaticString, line: UInt)
    func assertPicker(_ matcher: Matcher, hasValue value: String, inColumn column: Int, file: StaticString, line: UInt)
}

extension SenchaErrorMessage {
    static let viewIsNotADatePicker = "%@ is not a UIDatePicker."
    static let viewIsNotAPicker = "%@ is not a UIPicker."
}

extension XCTestCase: SenchaPickerAssertions {

    public func assertPicker(_ matcher: Matcher, hasValue value: Date, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let picker = view as? UIDatePicker else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotADatePicker, view), file: file, line: line)
            return
        }
        XCTAssertEqual(picker.date, value, file: file, line: line)
    }

    public func assertPicker(_ matcher: Matcher, hasValue value: String, inColumn column: Int, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let picker = view as? UIPickerView else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotAPicker, view), file: file, line: line)
            return
        }
        let selectedRow = picker.selectedRow(inComponent: column)
        let selectedValue = picker.delegate?.pickerView?(picker, titleForRow: selectedRow, forComponent: column)
        XCTAssertEqual(selectedValue, value, file: file, line: line)
    }
}
