// MARK: Scalar

extension KeyValueInfo: ExpressibleByUnicodeScalarLiteral
where Key: _ExpressibleByBuiltinUnicodeScalarLiteral {
    public typealias UnicodeScalarLiteralType = Key
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.key = value
    }
}

// MARK: GraphemeCluster

extension KeyValueInfo: ExpressibleByExtendedGraphemeClusterLiteral
where Key: _ExpressibleByBuiltinExtendedGraphemeClusterLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = Key
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.key = value
    }
}

// MARK: String

extension KeyValueInfo: ExpressibleByStringLiteral
where Key: _ExpressibleByBuiltinStringLiteral {
    public typealias StringLiteralType = Key
    
    public init(stringLiteral value: StringLiteralType) {
        self.key = value
    }
}
