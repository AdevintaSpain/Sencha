import UIKit
import XCTest

public protocol SenchaTableViewAssertions: EarlGreyHumanizer {

    func assertTableViewIsEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assertTableViewIsNotEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, file: StaticString, line: UInt)
    func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, inSection section: Int, file: StaticString, line: UInt)
    func assert(tableViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString, line: UInt)

}

extension XCTestCase: SenchaTableViewAssertions {

    public func assertTableViewIsEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(tableViewWith: matcher, hasRowCount: 0, file: file, line: line)
    }

    public func assertTableViewIsNotEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher)
        guard let tableView = view as? UITableView else {
            XCTFail("\(view) is not a TableView")
            return
        }
        XCTAssertTrue(tableView.numberOfRows(inSection: 0) > 0)
    }

    public func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, file: StaticString = #file, line: UInt = #line) {
        assert(tableViewWith: matcher, hasRowCount: rowCount, inSection: 0)
    }
    
    public func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, inSection section: Int, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher)
        guard let tableView = view as? UITableView else {
            XCTFail("\(view) is not a TableView")
            return
        }
        XCTAssertTrue(tableView.numberOfRows(inSection: section) == rowCount)
    }
    
    public func assert(tableViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher)
        guard let tableView = view as? UITableView else {
            XCTFail("\(view) is not a TableView")
            return
        }
        XCTAssertTrue(tableView.numberOfSections == sectionCount)
    }
}
