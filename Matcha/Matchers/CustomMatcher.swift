
import Foundation
import EarlGrey

struct CustomMatcher {
    
    static func firstElementMatcher() -> GREYMatcher {
        
        var firstMatch = true
        let matches: MatchesBlock = { (element: Any?) -> Bool in
            if firstMatch {
                firstMatch = false
                return true
            }
            
            return false
        }
        
        let description: DescribeToBlock = { (description: GREYDescription!) -> Void in
            guard let description = description else {
                return
            }
            description.appendText("first match")
        }
        
        return GREYElementMatcherBlock.init(matchesBlock: matches, descriptionBlock: description)
    }
}
