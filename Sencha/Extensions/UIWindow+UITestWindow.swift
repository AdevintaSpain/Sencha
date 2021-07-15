import UIKit

public extension UIWindow {
    
    /// Fix for http://stackoverflow.com/a/27153956/849645
    func set(rootViewController newRootViewController: UIViewController) {
        
        let previousViewController = rootViewController

        rootViewController = newRootViewController
        newRootViewController.setNeedsStatusBarAppearanceUpdate()

        if #available(iOS 13, *) {
            // `removeTransitionViews()` causes black screen on iOS13
        } else {
            removeTransitionViews()
        }
        
        if let previousViewController = previousViewController {
            // Modal view controllers presented by the previous view controller need to be manually dismissed or else they will remain in the
            // hierarchy, even on iOS 13. That will cause memory leaks and lots of "Multiple elements were matched" exceptions from EarlGrey.
            previousViewController.dismiss(animated: false) {
                // Remove the root view in case its still showing
                previousViewController.view.removeFromSuperview()
            }
        }
    }
    
    /// The presenting view controllers view doesn't get removed from the window as its currently transistioning and presenting a view controller
    private func removeTransitionViews() {
        if let transitionViewClass = NSClassFromString("UITransitionView") {
            for subview in subviews where subview.isKind(of: transitionViewClass) {
                subview.removeFromSuperview()
            }
        }
    }
}
