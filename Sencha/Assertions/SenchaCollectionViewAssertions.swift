
import UIKit
import EarlGrey

public protocol SenchaCollectionViewAssertions: EarlGreyHumanizer {

    func assertCollectionViewIsEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assertCollectionViewIsNotEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, inSection section: Int, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString, line: UInt)

}

public extension SenchaCollectionViewAssertions {

    func assertCollectionViewIsEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(collectionViewWith: matcher, hasCellCount: 0, file: file, line: line)
    }

    func assertCollectionViewIsNotEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let cellCountAssert = GREYAssertionBlock(name: "CollectionView is not empty") { (element, error) -> Bool in
            if let collectionView = element as? UICollectionView {
                let numberOfCells = collectionView.numberOfItems(inSection: 0)
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

    func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, file: StaticString = #file, line: UInt = #line) {
    
        assert(
            collectionViewWith: matcher,
            hasCellCount: cellCount,
            inSection: 0,
            file: file,
            line: line
        )
    }

    func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, inSection section: Int, file: StaticString = #file, line: UInt = #line) {

        let cellCountAssert = GREYAssertionBlock(name: "cell count") { (element, error) -> Bool in
            if let collectionView = element as? UICollectionView {
                let numberOfCells = collectionView.numberOfItems(inSection: section)
                return numberOfCells == cellCount
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
