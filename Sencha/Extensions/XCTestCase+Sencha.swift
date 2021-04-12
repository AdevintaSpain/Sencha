
import XCTest

public protocol Sencha: SenchaScrollableAssertion, SenchaTapActions, SenchaEditTextActions, SenchaSwipeActions, SenchaKeyboardActions, SenchaTableViewAssertions, SenchaSwitchAssertions, SenchaCollectionViewAssertions, SenchaSliderAssertions, SenchaSliderActions, SenchaPickerActions, SenchaPickerAssertions {}

struct SenchaErrorMessage {
    static let unsupportedTest = "This combination of methods and matchers is not supported"
}

extension XCTestCase: Sencha {

    private var window : UIWindow {
        get {
            return UIApplication.shared.keyWindow!
        }
    }
    
    override open func setUp() {
        super.setUp()
        window.layer.speed = 10.0
    }
    
    open func open(viewController: UIViewController, modally: Bool = false, embedInNavigation: Bool = false) {
        var viewControllerToOpen = viewController
        if embedInNavigation {
            viewControllerToOpen = embedInNavigationController(viewController)
        }
        
        if modally {
            window.set(rootViewController: UIViewController())
            window.rootViewController?.present(viewControllerToOpen, animated: true, completion: nil)
        } else {
            window.set(rootViewController: viewControllerToOpen)
        }
    }
    
    public func waitToBeVisible(viewControllerType: UIViewController.Type) {
        let condition = SenchaViewControllerCondition(window: window)
        condition.waitToBeVisible(viewControllerType)
    }

    private func embedInNavigationController(_ viewController: UIViewController) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }

    func findView(with matcher: Matcher, traits: UIAccessibilityTraits = .none, file: StaticString = #file, line: UInt = #line) -> UIView {
        var view: UIView!
        switch matcher {
        case .text(let text):
            view = tester().waitForView(withAccessibilityLabel: text, traits: traits)
        case .accessibilityLabel(let label):
            view = tester().waitForView(withAccessibilityLabel: label, traits: traits)
        case .accessibilityID(let accessibilityID):
            view = tester().waitForView(withAccessibilityLabel: accessibilityID, traits: traits)
        default:
            unsupportedTest(file: file, line: line)
        }
        return view
    }

    func unsupportedTest(file: StaticString, line: UInt) {
        XCTFail(SenchaErrorMessage.unsupportedTest, file: file, line: line)
    }
}
