
import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var switchOn: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var hiddenLabel: UILabel!

    struct AccessibilityID {

        static let textField = "DetailViewController.textField"
        static let switchOn = "DetailViewController.switchOn"
        static let slider = "DetailViewController.slider"
        static let datePicker = "DetailViewController.datePicker"
        static let hiddenLabel = "DetailViewController.hiddenLabel"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        textField.delegate = self
        textField.accessibilityIdentifier = AccessibilityID.textField
        switchOn.accessibilityIdentifier = AccessibilityID.switchOn
        slider.accessibilityIdentifier = AccessibilityID.slider
        datePicker.accessibilityIdentifier = AccessibilityID.datePicker
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        hiddenLabel.accessibilityIdentifier = AccessibilityID.hiddenLabel
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
