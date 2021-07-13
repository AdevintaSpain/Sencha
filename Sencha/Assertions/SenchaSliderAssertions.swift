import XCTest

public protocol SenchaSliderAssertions: EarlGreyHumanizer {
    func assertSlider(_ matcher: Matcher, hasValue value: ValueMatcher, file: StaticString, line: UInt)
}

extension SenchaErrorMessage {
    static let viewIsNotASlider = "%@ is not a UISlider."
}

extension XCTestCase: SenchaSliderAssertions {

    public func assertSlider(_ matcher: Matcher, hasValue value: ValueMatcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let slider = view as? UISlider else {
            XCTFail(String(format: SenchaErrorMessage.viewIsNotASlider, view), file: file, line: line)
            return
        }
        switch value {
        case .equalTo(let value):
            XCTAssertEqual(slider.value, Float(value), file: file, line: line)
        case .greaterThan(let value):
            XCTAssertGreaterThan(slider.value, Float(value), file: file, line: line)
        case .lessThan(let value):
            XCTAssertLessThan(slider.value, Float(value), file: file, line: line)
        }
    }
}
