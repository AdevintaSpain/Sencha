
import Foundation
import EarlGrey

public indirect enum ValueMatcher {
    case closeTo(Double, Double)
    case equalTo(Double)
    case lessThan(Double)
    case greaterThan(Double)

    func greyMatcher() -> GREYMatcher {
        switch self {
        case .closeTo(let value, let delta):
            return grey_closeTo(value, delta)
        case .equalTo(let value):
            return grey_equalTo(value)
        case .lessThan(let value):
            return grey_lessThan(value)
        case .greaterThan(let value):
            return grey_greaterThan(value)
        }
    }
}

public indirect enum Matcher {
    
    case text(String)
    case textFieldValue(String)
    case buttonTitle(String)
    case accessibilityID(String)
    case accessibilityLabel(String)
    case `class`(AnyClass)
    case conformsTo(Protocol)
    case respondsTo(Selector)
    case `nil`
    case notNil
    case systemAlertShown
    case keyWindow
    case firstResponder
    case visible
    case notVisible
    case interactable
    case ancestor(Matcher)
    case descendant(Matcher)
    case minimumVisisblePercent(Double)
    case not(Matcher)
    case allOf([Matcher])
    case anyOf([Matcher])
    case firstElement
    case firstElementWith(Matcher)
    case enabled
    case userInteractionEnabled
    case switchOn
    case switchOff
    case pickerColumnValue(Int, String)
    case datePickerValue(Date)
    case layout([Any], Matcher)
    case progress(Matcher)
    case scrollViewContentOffset(CGPoint)
    case selected
    case sliderValue(ValueMatcher)
    case stepperValue(Double)
    case anything()
    
    public func greyMatcher() -> GREYMatcher {
        switch self {
        case .text(let text):
            return grey_text(text)
        case .textFieldValue(let text):
            return grey_textFieldValue(text)
        case .buttonTitle(let title):
            return grey_buttonTitle(title)
        case .accessibilityID(let text):
            return grey_accessibilityID(text)
        case .accessibilityLabel(let text):
            return grey_accessibilityLabel(text)
        case .class(let aClass):
            return grey_kindOfClass(aClass)
        case .conformsTo(let aProtocol):
            return grey_conformsToProtocol(aProtocol)
        case .respondsTo(let selector):
            return grey_respondsToSelector(selector)
        case .firstResponder:
            return grey_firstResponder()
        case .visible:
            return grey_sufficientlyVisible()
        case .notVisible:
            return grey_notVisible()
        case .not(let matcher):
            return grey_not(matcher.greyMatcher())
        case .interactable:
            return grey_interactable()
        case .minimumVisisblePercent(let percent):
            return grey_minimumVisiblePercent(CGFloat(percent))
        case .allOf(let matchers):
            return grey_allOf(matchers.map{$0.greyMatcher()})
        case .anyOf(let matchers):
            return grey_anyOf(matchers.map{$0.greyMatcher()})
        case .firstElement:
            return CustomMatcher.firstElementMatcher()
        case .firstElementWith(let matcher):
            return grey_allOf([matcher.greyMatcher(), Matcher.firstElement.greyMatcher()])
        case .ancestor(let matcher):
            return grey_ancestor(matcher.greyMatcher())
        case .descendant(let matcher):
            return grey_descendant(matcher.greyMatcher())
        case .enabled:
            return grey_enabled()
        case .userInteractionEnabled:
            return grey_userInteractionEnabled()
        case .switchOn:
            return grey_switchWithOnState(true)
        case .switchOff:
            return grey_switchWithOnState(false)
        case .pickerColumnValue(let column, let value):
            return grey_pickerColumnSetToValue(column, value)
        case .datePickerValue(let date):
            return grey_datePickerValue(date)
        case .layout(let constraints, let referenceElement):
            return grey_layout(constraints, referenceElement.greyMatcher())
        case .progress(let comparisonMatcher):
            return grey_progress(comparisonMatcher.greyMatcher())
        case .scrollViewContentOffset(let offset):
            return grey_scrollViewContentOffset(offset)
        case .selected:
            return grey_selected()
        case .sliderValue(let valueMatcher):
            return grey_sliderValueMatcher(valueMatcher.greyMatcher())
        case .stepperValue(let value):
            return grey_stepperValue(value)
        case .nil:
            return grey_nil()
        case .notNil:
            return grey_notNil()
        case .systemAlertShown:
            return grey_systemAlertViewShown()
        case .keyWindow:
            return grey_keyWindow()
        case .anything():
            return grey_anything()
        }
    }
}

public indirect enum Action {

    case tap
    case tapAtPont(CGPoint)
    case doubleTap
    case doubleTapAtPoint(CGPoint)
    case longPress
    case longPressAtPointWithDuration(CGPoint, Double)
    case longPressWithDuration(Double)
    case multipleTapsWithCount(UInt)
    case moveSliderToValue(Double)
    case setPickerColumnToValue(Int, String)
    case setPickerDateTo(Date)

    func greyAction() -> GREYAction {
        switch self {
        case .tap:
            return grey_tap()
        case .tapAtPont(let point):
            return grey_tapAtPoint(point)
        case .doubleTap:
            return grey_doubleTap()
        case .doubleTapAtPoint(let point):
            return grey_doubleTapAtPoint(point)
        case .longPress:
            return grey_longPress()
        case .longPressAtPointWithDuration(let point, let duration):
            return grey_longPressAtPointWithDuration(point, duration)
        case .longPressWithDuration(let duration):
            return grey_longPressWithDuration(duration)
        case .multipleTapsWithCount(let count):
            return grey_multipleTapsWithCount(count)
        case .moveSliderToValue(let value):
            return grey_moveSliderToValue(Float(value))
        case .setPickerColumnToValue(let column, let value):
            return grey_setPickerColumnToValue(column, value)
        case .setPickerDateTo(let date):
            return grey_setDate(date)
        }
    }
}

public protocol EarlGreyHumanizer {
    
    func select(_ matcher: Matcher, file: StaticString, line: UInt) -> GREYInteraction
}

public extension EarlGreyHumanizer {
    
    func select(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYInteraction {
    
        return EarlGrey.selectElement(
            with: matcher.greyMatcher(),
            file: file,
            line: line
        )
    }
}

public extension GREYInteraction {
    @discardableResult public func assert(_ matcher: Matcher) -> Self {
        return self.assert(matcher.greyMatcher())
    }

    @discardableResult public func perform(_ action: Action) -> Self {
        return self.perform(action.greyAction())
    }
}
