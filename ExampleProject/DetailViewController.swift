
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    struct AccessibilityID {

        static let textField = "DetailViewController.textField"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        textField.accessibilityIdentifier = AccessibilityID.textField
    }
}
