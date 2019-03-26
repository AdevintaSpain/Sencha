
import Foundation
import EarlGrey

struct SenchaViewControllerCondition {
    var window: UIWindow

    @discardableResult func waitToBeVisible(_ viewControllerType: UIViewController.Type) -> Bool {
        let success = GREYCondition.init(name: "Wait ViewController to be visible", block: { () -> Bool in
            let viewController = self.topViewController(self.window.rootViewController)
            return viewController?.isKind(of: viewControllerType) ?? false
        }).wait(withTimeout: 10)

        return success
    }

    private func topViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        guard let rootViewController = rootViewController else {
            return nil
        }

        switch rootViewController {
        case let navigationController as UINavigationController:
            return topViewController(navigationController.viewControllers.last)
        case let tabBarController as UITabBarController:
            return topViewController(tabBarController.selectedViewController)
        default:
            guard let presented = rootViewController.presentedViewController else {
                return rootViewController
            }
            return topViewController(presented)
        }
    }
}
