
import Foundation
import XCTest
import Matcha

@testable import ExampleProject

class ViewDetailShould: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: MainViewController.self))
    
    override func setUp() {
        super.setUp()
        open(viewController: storyboard.instantiateViewController(withIdentifier: "DetailViewController"))
    }
    
    func test_show_one_enabled_button_and_one_disabled_button() {
        
    }
}
