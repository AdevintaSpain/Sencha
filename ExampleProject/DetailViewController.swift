
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var switchOn: UISwitch!

    struct AccessibilityID {

        static let textField = "DetailViewController.textField"
        static let switchOn = "DetailViewController.switchOn"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        textField.accessibilityIdentifier = AccessibilityID.textField
        switchOn.accessibilityIdentifier = AccessibilityID.switchOn
    }
}
