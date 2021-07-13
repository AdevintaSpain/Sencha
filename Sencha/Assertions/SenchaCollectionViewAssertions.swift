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
        let view = findView(with: matcher, file: file, line: line)
        guard let collectionView = view as? UICollectionView else {
            XCTFail("\(view) is not a CollectionView", file: file, line: line)
            return
        }
        if collectionView.numberOfSections == 0 {
            XCTAssertEqual(collectionView.numberOfSections, 0, file: file, line: line)
        } else {
            assert(collectionViewWith: matcher, hasCellCount: 0, file: file, line: line)
        }
    }

    public func assertCollectionViewIsNotEmpty(with matcher: Matcher, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let collectionView = view as? UICollectionView else {
            XCTFail("\(view) is not a CollectionView", file: file, line: line)
            return
        }
        XCTAssertGreaterThan(collectionView.numberOfItems(inSection: 0), 0, file: file, line: line)
    }

    public func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, file: StaticString = #file, line: UInt = #line) {
        assert(collectionViewWith: matcher, hasCellCount: cellCount, inSection: 0, file: file, line: line)
    }

    public func assert(collectionViewWith matcher: Matcher, hasCellCount cellCount: Int, inSection section: Int, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let collectionView = view as? UICollectionView else {
            XCTFail("\(view) is not a CollectionView", file: file, line: line)
            return
        }
        XCTAssertEqual(collectionView.numberOfItems(inSection: section), cellCount, file: file, line: line)
    }

    public func assert(collectionViewWith matcher: Matcher, hasSectionCount sectionCount: Int, file: StaticString = #file, line: UInt = #line) {
        let view = findView(with: matcher, file: file, line: line)
        guard let collectionView = view as? UICollectionView else {
            XCTFail("\(view) is not a CollectionView", file: file, line: line)
            return
        }
        XCTAssertEqual(collectionView.numberOfSections, sectionCount, file: file, line: line)
    }
}
