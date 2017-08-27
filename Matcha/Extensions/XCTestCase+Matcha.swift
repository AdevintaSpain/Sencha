
import XCTest

public protocol Matcha: MatchaAssertion, MatchaScrollableAssertion, MatchaTapActions, MatchaEditTextActions, MatchaScrollViewActions, MatchaKeyboardActions, MatchaTableViewAssertions {}


protocol PropertyStoring {
    associatedtype T
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T
}

extension PropertyStoring {
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: T) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            return defaultValue
        }
        return value
    }
}

extension XCTestCase: Matcha, PropertyStoring {

    typealias T = UIWindow
    
    private struct CustomProperties {
        static var window = UIApplication.shared.keyWindow!
    }
    
    private var window : UIWindow {
        get {
            return getAssociatedObject(&CustomProperties.window, defaultValue: CustomProperties.window)
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
