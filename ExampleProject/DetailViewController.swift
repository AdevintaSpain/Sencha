
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var switchOn: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!

    struct AccessibilityID {

        static let textField = "DetailViewController.textField"
        static let switchOn = "DetailViewController.switchOn"
        static let slider = "DetailViewController.slider"
        static let datePicker = "DetailViewController.datePicker"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        textField.accessibilityIdentifier = AccessibilityID.textField
        switchOn.accessibilityIdentifier = AccessibilityID.switchOn
        slider.accessibilityIdentifier = AccessibilityID.slider
        datePicker.accessibilityIdentifier = AccessibilityID.datePicker
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
    }
}
