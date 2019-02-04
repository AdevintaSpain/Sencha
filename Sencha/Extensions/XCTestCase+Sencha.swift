
import XCTest

public protocol Sencha: SenchaScrollableAssertion, SenchaTapActions, SenchaEditTextActions, SenchaSwipeActions, SenchaKeyboardActions, SenchaTableViewAssertions, SenchaSwitchAssertions, SenchaCollectionViewAssertions, SenchaSliderAssertions, SenchaSliderActions, SenchaPickerActions {}

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
    
    private func embedInNavigationController(_ viewController: UIViewController) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
