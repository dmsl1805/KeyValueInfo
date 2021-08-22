import Foundation
import KeyValueInfo

@dynamicMemberLookup
public struct UserDefaultsProxy {
    public let getValueForKey: (String) -> Any?
    public let setValueForKey: (Any?, String) -> Void

    public init(
        getValueForKey: @escaping (String) -> Any?,
        setValueForKey: @escaping (Any?, String) -> Void
    ) {
        self.getValueForKey = getValueForKey
        self.setValueForKey = setValueForKey
    }
    
    // MARK: subscript
    
    // MARK: KeyValueInfoFactory
    
    public subscript<Value>(
        dynamicMember keyPath: KeyPath<KeyValueInfoFactory, KeyValueInfo<String, Value>>
    ) -> Value? {
        get {
            value(forKeyPath: keyPath)
        }
        set {
            set(value: newValue, forKeyPath: keyPath)
        }
    }
    
    // MARK: KeyValueInfo
    
    public subscript<Value>(
        dynamicMember keyValueInfo: KeyValueInfo<String, Value>
    ) -> Value? {
        get {
            value(forKey: keyValueInfo)
        }
        set {
            set(value: newValue, forKey: keyValueInfo)
        }
    }
    
    // MARK: Get
    
    // MARK: KeyValueInfoFactory

    public func value<Value>(
        forKeyPath keyPath: KeyPath<KeyValueInfoFactory, KeyValueInfo<String, Value>>
    ) -> Value? {
        value(forKey: KeyValueInfoFactory()[keyPath: keyPath])
    }
    
    // MARK: KeyValueInfo

    public func value<Value>(forKey keyValueInfo: KeyValueInfo<String, Value>) -> Value? {
        guard let anyValue = getValueForKey(keyValueInfo.key) else {
            return nil
        }
        guard let value = anyValue as? Value else {
            assertionFailure()
            return nil
        }
        return value
    }
    
    // MARK: Set
    
    // MARK: KeyValueInfoFactory
    
    public func set<Value>(
        value: Value?,
        forKeyPath keyPath: KeyPath<KeyValueInfoFactory, KeyValueInfo<String, Value>>
    ) {
        set(value: value, forKey: KeyValueInfoFactory()[keyPath: keyPath])
    }
    
    // MARK: KeyValueInfo
    
    public func set<Value>(
        value: Value?,
        forKey keyValueInfo: KeyValueInfo<String, Value>
    ) {
        setValueForKey(value, keyValueInfo.key)
    }
}

public extension UserDefaultsProxy {
    static var `default`: UserDefaultsProxy {
        UserDefaultsProxy(
            getValueForKey: UserDefaults.standard.value(forKey:),
            setValueForKey: UserDefaults.standard.setValue(_:forKey:)
        )
    }
}
