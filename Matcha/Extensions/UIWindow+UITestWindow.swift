
import UIKit

private struct Constants {
    static let windowLayerSpeedMultiplier: Float = 5.0
}

public extension UIWindow {
    
    class func fastUITestWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.layer.speed = Constants.windowLayerSpeedMultiplier
        return window
    }
}
