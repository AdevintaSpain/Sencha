
import Foundation
import EarlGrey

struct SenchaViewControllerCondition {
    private(set) var window: UIWindow

    @discardableResult func waitToBeVisible(_ viewControllerType: UIViewController.Type) -> Bool {
        let success = GREYCondition.init(name: "Wait ViewController to be visible", block: { () -> Bool in

            guard let rootViewController = self.window.rootViewController else { return false }
            let viewController = self.topViewController(rootViewController)
            return viewController.isKind(of: viewControllerType)
        }).wait(withTimeout: 10)

        return success
    }

    private func topViewController(_ rootViewController: UIViewController) -> UIViewController {
        switch rootViewController {
        case let navigationController as UINavigationController:
            return navigationController.topViewController ?? rootViewController
        case let tabBarController as UITabBarController:
            guard let selectedViewController = tabBarController.selectedViewController else {
                return rootViewController
            }
            return topViewController(selectedViewController)
        case let splitViewController as UISplitViewController:
            guard let viewController = splitViewController.viewControllers.last else {
                return rootViewController
            }
            return topViewController(viewController)
        default:
            guard let presented = rootViewController.presentedViewController else {
                return rootViewController
            }
            return topViewController(presented)
        }
    }
}
