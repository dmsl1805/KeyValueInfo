#if canImport(UIKit)
import XCTest
import CwlPreconditionTesting

import KeyValueInfo
import KeyValueInfo_UIKit

final class CustomTableViewCell: UITableViewCell { }
final class CustomHeaderFooterTableViewCell: UITableViewHeaderFooterView { }

final class OtherTableViewCell: UITableViewCell { }
final class OtherHeaderFooterTableViewCell: UITableViewHeaderFooterView { }

extension KeyValueInfo where Key == String {
    static var tableCell: KeyValueInfo<Key, CustomTableViewCell> { #function }
    static var tableHeaderFooterCell: KeyValueInfo<Key, CustomHeaderFooterTableViewCell> { #function }
    
    static var otherCell: KeyValueInfo<Key, OtherTableViewCell> { "tableCell" }
    static var otherHeaderFooterCell: KeyValueInfo<Key, OtherHeaderFooterTableViewCell> { "tableHeaderFooterCell" }
}

final class KeyValueInfoUIKitTests: XCTestCase {
    func test() {
        let tableView = UITableView()
        
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: .tableCell
        )
        
        _ = { () -> CustomTableViewCell in
            tableView.dequeueReusableCell(withIdentifier: .tableCell, for: IndexPath(index: 0))
        }
        
        tableView.register(
            CustomHeaderFooterTableViewCell.self,
            forHeaderFooterViewReuseIdentifier: .tableHeaderFooterCell
        )
        
        _ = { () -> CustomHeaderFooterTableViewCell in
            tableView.dequeueReusableHeaderFooterView(withIdentifier: .tableHeaderFooterCell)
        }
    }
    
    func testFailureType() {
        let tableView = UITableView()
        let userDefaults = UserDefaults.standard
        let identifier = ""
        let indexPath = IndexPath(index: 0)
        
        
        
        _ = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        userDefaults.setValue(123, forKey: "key")
        userDefaults.setValue(true, forKey: "key")
            
        tableView.register(
            OtherTableViewCell.self,
            forCellReuseIdentifier: .otherCell
        )
        
        _ = catchBadInstruction {
            _ = { () -> CustomTableViewCell in
                tableView.dequeueReusableCell(withIdentifier: .tableCell, for: IndexPath(index: 0))
            }()
        }
    }
}
#endif
