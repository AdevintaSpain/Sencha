import Foundation
import XCTest
import Sencha

@testable import ExampleProject

class MainViewShould: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: MainViewController.self))
    var viewController: MainViewController!

    override func setUp() {
        super.setUp()
        
        let navigationController = storyboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        viewController = navigationController.viewControllers.first as? MainViewController
        open(viewController: navigationController)
    }

    func test_be_able_to_assert_TableView_is_empty() {
        viewController.clearTableView()
        assertTableViewIsEmpty(with: .accessibilityID(MainViewController.AccessibilityID.tableView))
    }

    func test_be_able_to_assert_TableView_is_not_empty() {

        assertTableViewIsNotEmpty(with: .accessibilityID(MainViewController.AccessibilityID.tableView))
    }

    func test_be_able_to_assert_the_number_of_rows() {
        
        assert(tableViewWith: .accessibilityID(MainViewController.AccessibilityID.tableView), hasRowCount: 100)
    }
    
    func test_be_able_to_assert_the_number_of_sections() {
        
        assert(tableViewWith: .accessibilityID(MainViewController.AccessibilityID.tableView), hasSectionCount: 1)
    }
    
    func test_be_able_to_scroll_to_an_offscreen_cell_and_verify_the_content() {
    
        assertVisible(.text("20"), inScrollableElementWith: .accessibilityID(MainViewController.AccessibilityID.tableView))
    }
    
    func test_be_able_to_tap_elements_and_verify_the_result() {
    
        tap(.text("Edit"))
        assertVisible(.text("Edit Mode"))
    }
    
    func test_be_able_to_navigate_to_a_detail_view() {
        
        tap(.text("12"), inScrollableElementWith: .accessibilityID(MainViewController.AccessibilityID.tableView))
        assertVisible(.text("Detail"))
    }

    func test_be_able_to_navigate_to_a_detail_and_then_go_back() {

        assertVisible(.text("Sencha Example"))

        tap(.text("12"), inScrollableElementWith: .accessibilityID(MainViewController.AccessibilityID.tableView))
        assertVisible(.text("Detail"))
        tapBackButton()

        assertVisible(.text("Sencha Example"))
    }
}
