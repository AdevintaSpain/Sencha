import UIKit
import XCTest

public protocol SenchaCollectionViewAssertions: EarlGreyHumanizer {

    func assertCollectionViewIsEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assertCollectionViewIsNotEmpty(with matcher: Matcher, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, inSection section: Int, file: StaticString, line: UInt)
    func assert(collectionViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString, line: UInt)

}

extension XCTestCase: SenchaCollectionViewAssertions {

    public func assertCollectionViewIsEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        assert(collectionViewWith: matcher, hasCellCount: 0, file: file, line: line)
    }

    public func assertCollectionViewIsNotEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher)
        guard let collectionView = view as? UICollectionView else {
            XCTFail("\(view) is not a CollectionView")
            return
        }
        XCTAssertTrue(collectionView.numberOfItems(inSection: 0) > 0)
    }

    public func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, file: StaticString = #file, line: UInt = #line) {
        assert(collectionViewWith: matcher, hasCellCount: cellCount, inSection: 0)
    }

    public func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, inSection section: Int, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher)
        guard let collectionView = view as? UICollectionView else {
            XCTFail("\(view) is not a CollectionView")
            return
        }
        XCTAssertTrue(collectionView.numberOfItems(inSection: section) == cellCount)
    }

    public func assert(collectionViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher)
        guard let collectionView = view as? UICollectionView else {
            XCTFail("\(view) is not a CollectionView")
            return
        }
        XCTAssertTrue(collectionView.numberOfSections == sectionCount)
    }
}
