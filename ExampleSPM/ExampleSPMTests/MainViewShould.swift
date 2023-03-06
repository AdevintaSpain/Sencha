import Foundation
import XCTest
import Sencha

@testable import ExampleSPM

class MainViewShould: XCTestCase {

    let TABLE_VIEW_MATCHER = Matcher.accessibilityID(MainViewController.AccessibilityID.tableView)

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
        assertTableViewIsEmpty(with: TABLE_VIEW_MATCHER)
    }

    func test_be_able_to_assert_TableView_is_not_empty() {
        assertTableViewIsNotEmpty(with: TABLE_VIEW_MATCHER)
    }

    func test_be_able_to_assert_the_number_of_rows() {
        assert(tableViewWith: TABLE_VIEW_MATCHER, hasRowCount: 100)
    }
    
    func test_be_able_to_assert_the_number_of_sections() {
        assert(tableViewWith: TABLE_VIEW_MATCHER, hasSectionCount: 1)
    }
    
    func test_be_able_to_scroll_to_an_offscreen_cell_and_verify_the_content() {

        assertVisible(.text("20"))
    }

    func test_be_able_to_scroll_to_bottom_and_verify_the_content() {
        scroll(to: .bottom, in: TABLE_VIEW_MATCHER)
        assertVisible(.text("20"))
    }

    func test_be_able_to_scroll_to_bottom_then_scroll_to_top_and_verify_the_content() {
        assertVisible(.text("20"))
        scroll(to: .top, in: TABLE_VIEW_MATCHER)
        assertVisible(.text("1"))
    }
    
    func test_be_able_to_tap_elements_and_verify_the_result() {
        tap(.text("Edit"))
        assertVisible(.text("Edit Mode"))
    }
    
    func test_be_able_to_navigate_to_a_detail_view() {
        tap(.text("12"))
        assertVisible(.text("Detail"))
    }

    func test_be_able_to_navigate_to_a_detail_and_then_go_back() {
        assertVisible(.text("Sencha Example"))

        tap(.text("12"))
        assertVisible(.text("Detail"))
        tap(.accessibilityLabel("Sencha Example"))

        assertVisible(.text("Sencha Example"))
    }

    func test_be_able_to_swipe_in_cell_shows_delete_button() {
        swipe(.text("1"), inDirection: .left)
        assertVisible(.text("Delete"))
    }
}
