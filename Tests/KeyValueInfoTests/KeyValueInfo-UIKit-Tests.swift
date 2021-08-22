#if canImport(UIKit)
import XCTest

import KeyValueInfo
import KeyValueInfo_UIKit

final class CustomTableViewCell: UITableViewCell { }

extension KeyValueInfo where Key == String {
    static var tableCell: KeyValueInfo<Key, CustomTableViewCell> { #function }
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
    }
}
#endif
