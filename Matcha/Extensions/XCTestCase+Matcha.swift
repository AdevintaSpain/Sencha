
import XCTest

protocol Matcha: MatchaAssertion, MatchaScrollableAssertion, MatchaTapActions, MatchaEditTextActions, MatchaScrollViewActions, MatchaKeyboardActions, MatchaTableViewAssertions {}

extension XCTestCase: Matcha {}
