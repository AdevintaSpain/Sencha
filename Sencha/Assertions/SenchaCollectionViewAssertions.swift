
import UIKit
import EarlGrey

public protocol SenchaCollectionViewAssertions: EarlGreyHumanizer {

    func assert(collectionViewWith matcher: Matcher, hasRowCount rowCount: Int, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasRowCount rowCount: Int, inSection section: Int, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString, line: UInt)

}

public extension SenchaCollectionViewAssertions {

    func assert(collectionViewWith matcher: Matcher, hasRowCount rowCount: Int, file: StaticString = #file, line: UInt = #line) {

        assert(
            collectionViewWith: matcher,
            hasSectionCount: 1,
            file: file,
            line: line
        )

        assert(
            collectionViewWith: matcher,
            hasRowCount: rowCount,
            inSection: 0,
            file: file,
            line: line
        )
    }

    func assert(collectionViewWith matcher: Matcher, hasRowCount rowCount: Int, inSection section: Int, file: StaticString = #file, line: UInt = #line) {

        let cellCountAssert = GREYAssertionBlock(name: "cell count") { (element, error) -> Bool in
            if let collectionView = element as? UICollectionView {
                let numberOfCells = collectionView.numberOfItems(inSection: section)
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

    func assert(collectionViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString = #file, line: UInt = #line) {

        let sectionCountAssert = GREYAssertionBlock(name: "section count") { (element, error) -> Bool in
            if let collectionView = element as? UICollectionView {
                let numberOfSections = collectionView.numberOfSections
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
