import Foundation

infix operator ?=: ComparisonPrecedence
infix operator ?!=: ComparisonPrecedence

public extension CharacterSet {
    public static var hexaDecimal: CharacterSet {
        return CharacterSet(charactersIn: "0123456789abcdefABCDEF")
    }
    
    public func contains(_ c: Character) -> Bool {
        return self.contains(c.unicodeScalars.first!)
    }
    
    public func union(_ str: String) -> CharacterSet {
        return self.union(CharacterSet(charactersIn: str))
    }
}

extension CharacterSet: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: CharacterSet.StringLiteralType) {
        self.init(charactersIn: value)
    }
}

public func ~=(lhs: CharacterSet, rhs: Character) -> Bool {
    return lhs.contains(rhs)
}

public func ?=(lhs: Character, rhs: CharacterSet) -> Bool {
    return rhs.contains(lhs)
}

public func ?=(lhs: Character, rhs: [CharacterSet]) -> Bool {
    return rhs.reduce(true, { $0 && $1.contains(lhs) })
}

public func ?!=(lhs: Character, rhs: CharacterSet) -> Bool {
    return !(lhs ?= rhs)
}

public func ?!=(lhs: Character, rhs: [CharacterSet]) -> Bool {
    return !(lhs ?= rhs)
}

public func +(lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet {
    return lhs.union(rhs)
}

public func -(lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet {
    return lhs.subtracting(rhs)
}
