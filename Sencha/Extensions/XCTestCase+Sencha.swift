import XCTest

/// This struct can be extended to add different error messages.
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

    /// Use this method to present a specific view in the test Window.
    /// - Parameters:
    ///   - viewController: A view controller to embed in the main UIWindow.
    ///   - modally: Use this property to simulate a modal presentation.
    ///   - embedInNavigation: Use this property to simulate push inside a UINavigationController.
    open func `open`(viewController: UIViewController, modally: Bool = false, embedInNavigation: Bool = false) {
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
    /// - Parameters:
    ///   - matcher: Specify an accessibility feature to find the view.
    ///   - traits: Some additional accessibility traits can be provided to narrow down the search if multiple items
    ///   can be found by the same accessibility trait.
    ///   - file: Used to highlight the correct file when a test fails.(Do not use)
    ///   - line: Used to highlight the correct line when a test fails.(Do not use)
    /// - Returns: The view instance that has been found for the given parameters.
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
