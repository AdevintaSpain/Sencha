
import Foundation
import EarlGrey

public indirect enum Matcher {
    
    case text(String)
    case accessibilityID(String)
    case accessibilityLabel(String)
    case `class`(AnyClass)
    case firstResponder
    case visible
    case notVisible
    case not(Matcher)
    case allOf([Matcher])
    case anyOf([Matcher])
    case firstElement
    case firstElementWith(Matcher)
    case enabled
    case userInteractionEnabled
    case switchOn
    
    public func greyMatcher() -> GREYMatcher {
        switch self {
        case .text(let text):
            return grey_text(text)
        case .accessibilityID(let text):
            return grey_accessibilityID(text)
        case .accessibilityLabel(let text):
            return grey_accessibilityLabel(text)
        case .class(let aClass):
            return grey_kindOfClass(aClass)
        case .firstResponder:
            return grey_firstResponder()
        case .visible:
            return grey_sufficientlyVisible()
        case .notVisible:
            return grey_notVisible()
        case .not(let matcher):
            return grey_not(matcher.greyMatcher())
        case .allOf(let matchers):
            return grey_allOf(matchers.map{$0.greyMatcher()})
        case .anyOf(let matchers):
            return grey_anyOf(matchers.map{$0.greyMatcher()})
        case .firstElement:
            return CustomMatcher.firstElementMatcher()
        case .firstElementWith(let matcher):
            return grey_allOf([matcher.greyMatcher(), Matcher.firstElement.greyMatcher()])
        case .enabled:
            return grey_enabled()
        case .userInteractionEnabled:
            return grey_userInteractionEnabled()
        case .switchOn:
            return grey_switchWithOnState(true)
        }
    }
}

public protocol EarlGreyHumanizer {
    
    func select(_ matcher: Matcher, file: StaticString, line: UInt) -> GREYElementInteraction
}

public extension EarlGreyHumanizer {
    
    func select(_ matcher: Matcher, file: StaticString = #file, line: UInt = #line) -> GREYElementInteraction {
    
        return EarlGrey.select(
            elementWithMatcher: matcher.greyMatcher(),
            file: file,
            line: line
        )
    }
}

public extension GREYElementInteraction {
    @discardableResult public func assert(_ matcher: @autoclosure () -> Matcher) -> Self {
        return self.assert(with:matcher().greyMatcher())
    }
}
