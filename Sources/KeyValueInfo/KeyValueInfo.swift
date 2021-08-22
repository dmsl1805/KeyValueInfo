import Foundation

// MARK: KeyValueInfo

public struct KeyValueInfo<Key, Value>: RawRepresentable {
    public let key: Key
    public var rawValue: Key { key }

    public init(rawValue: Key) {
        self.key = rawValue
    }
    
    public init(key: Key) {
        self.key = key
    }
}
