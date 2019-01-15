
import UIKit
import EarlGrey

public protocol SenchaTableViewAssertions: EarlGreyHumanizer {

    func assertTableViewIsEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assertTableViewIsNotEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, file: StaticString, line: UInt)
    func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, inSection section: Int, file: StaticString, line: UInt)
    func assert(tableViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString, line: UInt)

}

public extension SenchaTableViewAssertions {

    func assertTableViewIsEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(tableViewWith: matcher, hasRowCount: 0, file: file, line: line)
    }

    func assertTableViewIsNotEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let cellCountAssert = GREYAssertionBlock(name: "TableView is not empty") { (element, error) -> Bool in
            if let tableView = element as? UITableView {
                let numberOfCells = tableView.numberOfRows(inSection: 0)
                return numberOfCells > 0
            }
            return false
        }

        select(
            matcher,
            file: file,
            line: line
        ).assert(
            cellCountAssert
        )
    }

    func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, file: StaticString = #file, line: UInt = #line) {
        
        assert(
            tableViewWith: matcher,
            hasRowCount: rowCount,
            inSection: 0,
            file: file,
            line: line
        )
    }
    
    func assert(tableViewWith matcher: Matcher, hasRowCount rowCount: Int, inSection section: Int, file: StaticString = #file, line: UInt = #line) {
    
        let cellCountAssert = GREYAssertionBlock(name: "cell count") { (element, error) -> Bool in
            if let tableView = element as? UITableView {
                let numberOfCells = tableView.numberOfRows(inSection: section)
                return numberOfCells == rowCount
            }
            return false
        }
        
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            cellCountAssert
        )
    }
    
    func assert(tableViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString = #file, line: UInt = #line) {
    
        let sectionCountAssert = GREYAssertionBlock(name: "section count") { (element, error) -> Bool in
            if let tableView = element as? UITableView {
                let numberOfSections = tableView.numberOfSections
                return numberOfSections == sectionCount
            }
            return false
        }
        
        select(
            matcher,
            file: file,
            line: line
        ).assert(
            sectionCountAssert
        )
    }
}
