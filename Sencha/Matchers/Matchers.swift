import Foundation

public indirect enum ValueMatcher {
    case equalTo(Double)
    case lessThan(Double)
    case greaterThan(Double)
}

public indirect enum Matcher {
    case text(String)
    case accessibilityID(String)
    case accessibilityLabel(String)
}
