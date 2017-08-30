
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let rows: [Int] = Array(1...100)
    
    override func viewDidLoad() {
        title = "Matcha Example"
    }
    
    //MARK: TableViewDataSource
    
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
        //
    }
}

