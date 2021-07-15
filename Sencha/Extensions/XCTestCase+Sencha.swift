import XCTest

struct SenchaErrorMessage {}

extension XCTestCase {

    private var window : UIWindow {
        get {
            return UIApplication.shared.keyWindow!
        }
    }
    
    override open func setUp() {
        super.setUp()
        window.layer.speed = 10.0
    }

    /// Use this method to present a specific view in the test Window
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

    private func embedInNavigationController(_ viewController: UIViewController) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }

    /// This method waits for a view to become visible and then returns that instance to the caller
    public func findView(with matcher: Matcher, traits: UIAccessibilityTraits = .none, file: StaticString = #file, line: UInt = #line) -> UIView {
        var view: UIView!
        switch matcher {
        case .text(let text):
            view = tester().waitForView(withAccessibilityLabel: text, traits: traits)
        case .accessibilityLabel(let label):
            view = tester().waitForView(withAccessibilityLabel: label, traits: traits)
        case .accessibilityID(let accessibilityID):
            view = tester().waitForView(withAccessibilityIdentifier: accessibilityID)
        }
        return view
    }
}
