
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
        var viewController: UIViewController?

        switch rootViewController {
        case let navigationController as UINavigationController:
            viewController = navigationController.topViewController
        case let tabBarController as UITabBarController:
            viewController = tabBarController.selectedViewController
        case let splitViewController as UISplitViewController:
            viewController = splitViewController.viewControllers.last
        default:
            viewController = rootViewController.presentedViewController
        }
        guard let nextViewController = viewController else {
            return rootViewController
        }
        return topViewController(nextViewController)
    }
}
