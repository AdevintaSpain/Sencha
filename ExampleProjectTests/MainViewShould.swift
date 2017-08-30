
import Foundation
import XCTest
import Matcha

@testable import ExampleProject

class MainViewShould: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_be_able_to_assert_the_number_of_rows() {
        
        assert(tableViewWith: .accessibilityID(MainViewController.AccessibilityID.tableView), hasRowCount: 100)
    }
    
    func test_be_able_to_assert_the_number_of_sections() {
        
        assert(tableViewWith: .accessibilityID(MainViewController.AccessibilityID.tableView), hasSectionCount: 1)
    }
    
    func test_be_able_to_scroll_to_an_offscreen_cell_and_verify_the_content() {
    
        assertVisible(.text("48"), inScrollableElementWith: .accessibilityID(MainViewController.AccessibilityID.tableView))
    }
    
    func test_be_able_to_tap_elements_and_verify_the_result() {
    
        tap(.text("Edit"))
        
        assertVisible(.text("Edit Mode"))
    }
}
