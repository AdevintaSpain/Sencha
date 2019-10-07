
import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct AccessibilityID {
        static let tableView = "MainViewController.TableView"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    var rows: [Int] = Array(1...100)
    
    var sectionTitle = "Normal Mode"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sencha Example"
        tableView.accessibilityIdentifier = AccessibilityID.tableView
    }

    @IBAction func editButtonPressed(_ sender: Any) {
        
        sectionTitle = sectionTitle == "Normal Mode" ? "Edit Mode" : "Normal Mode"
        tableView.reloadData()
    }

    func clearTableView() {
        rows = []
    }
    
    //MARK: TableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCellID")
        cell.textLabel?.text = "\(rows[indexPath.row])"
        return cell
    }
    
    //MARK: TableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailViewSegue", sender: self)
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
}

