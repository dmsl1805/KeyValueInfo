import XCTest
import CwlPreconditionTesting

import KeyValueInfo
import KeyValueInfo_UserDefaults

extension KeyValueInfoFactory {
    var token: KeyValueInfo<String, String> { #function }
    var isAuthorized: KeyValueInfo<String, Bool> { #function }
    var sessionCount: KeyValueInfo<String, NSNumber> { #function }
}

final class MockUserDefaultsProxy {
    private var data: [String: Any] = [:]
    
    private(set) lazy var mock: UserDefaultsProxy = {
        UserDefaultsProxy(
            getValueForKey: { self.data[$0] },
            setValueForKey: { self.data[$1] = $0 }
        )
    }()
}

final class KeyValueInfoUserDefaultsTests: XCTestCase {
    func testString() {
        var userDefaults = MockUserDefaultsProxy().mock
        
        XCTAssertNil(userDefaults.token)
        
        let token = UUID().uuidString
        
        userDefaults.token = token
        XCTAssertEqual(userDefaults.token, token)
    }
    
    func testBool() {
        var userDefaults = MockUserDefaultsProxy().mock
        
        XCTAssertNil(userDefaults.isAuthorized)
        
        var isAuthorized = false
        
        userDefaults.isAuthorized = isAuthorized
        XCTAssertEqual(userDefaults.isAuthorized, isAuthorized)
        
        isAuthorized = true
        XCTAssertNotEqual(userDefaults.isAuthorized, isAuthorized)
        
        userDefaults.isAuthorized = isAuthorized
        XCTAssertEqual(userDefaults.isAuthorized, isAuthorized)
    }
    
    func testNumber() {
        var userDefaults = MockUserDefaultsProxy().mock
        
        XCTAssertNil(userDefaults.sessionCount)
        
        var sessionCount: NSNumber = 0
        
        userDefaults.sessionCount = sessionCount
        XCTAssertEqual(userDefaults.sessionCount, sessionCount)
        
        sessionCount = 5
        XCTAssertNotEqual(userDefaults.sessionCount, sessionCount)
        
        userDefaults.sessionCount = sessionCount
        XCTAssertEqual(userDefaults.sessionCount, sessionCount)
    }
    
    func testTypeCastingAssertion() {
        let userDefaults = MockUserDefaultsProxy().mock
        
        let keyInt: KeyValueInfo<String, Int> = "key"
        let keyBool: KeyValueInfo<String, Bool> = "key"

        userDefaults.set(value: true, forKey: keyBool)
        
        _ = catchBadInstruction {
            _ = userDefaults.value(forKey: keyInt)
        }
    }
}
