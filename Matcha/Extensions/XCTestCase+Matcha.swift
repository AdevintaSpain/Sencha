
import XCTest

protocol Matcha: MatchaAssertion, MatchaScrollableAssertion, MatchaTapActions, MatchaTableViewActions, MatchaEditTextActions, MatchaScrollViewActions, MatchaKeyboardActions, MatchaTableViewAssertions {}

extension XCTestCase: Matcha {}
