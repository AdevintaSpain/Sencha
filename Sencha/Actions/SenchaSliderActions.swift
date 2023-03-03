import XCTest

public protocol SenchaSliderActions {
    func moveSlider(_ matcher: Matcher, to value: Double, file: StaticString, line: UInt)
}

extension XCTestCase: SenchaSliderActions {

    public func moveSlider(_ matcher: Matcher, to value: Double, file: StaticString = #file, line: UInt = #line) {
        switch matcher {
        case .text(let label), .accessibilityLabel(let label):
            tester().setValue(Float(value), forSliderWithAccessibilityLabel: label)
        case .accessibilityID(let accessibilityID):
            tester().setValue(Float(value), forSliderWithAccessibilityIdentifier: accessibilityID)
        }
    }
}
