#if canImport(UIKit)
import UIKit
import KeyValueInfo

public extension UITableView {
    
    // MARK: Register
    
    func register<Cell>(
        _ nib: UINib?,
        forCellReuseIdentifier keyValueInfo: KeyValueInfo<String, Cell>
    ) where Cell: UITableViewCell {
        register(nib, forCellReuseIdentifier: keyValueInfo.key)
    }

    func register<Cell>(
        _ cellClass: AnyClass?,
        forCellReuseIdentifier keyValueInfo: KeyValueInfo<String, Cell>
    ) where Cell: UITableViewCell {
        register(cellClass, forCellReuseIdentifier: keyValueInfo.key)
    }

    
    func register<Cell>(
        _ nib: UINib?,
        forHeaderFooterViewReuseIdentifier keyValueInfo: KeyValueInfo<String, Cell>
    ) where Cell: UITableViewCell {
        register(nib, forHeaderFooterViewReuseIdentifier: keyValueInfo.key)
    }

    func register<Cell>(
        _ aClass: AnyClass?,
        forHeaderFooterViewReuseIdentifier keyValueInfo: KeyValueInfo<String, Cell>
    ) where Cell: UITableViewHeaderFooterView {
        register(aClass, forHeaderFooterViewReuseIdentifier: keyValueInfo.key)
    }

    // MARK: Dequeue
    
    func dequeueReusableCell<Cell>(
        withIdentifier keyValueInfo: KeyValueInfo<String, Cell>,
        for indexPath: IndexPath
    ) -> Cell where Cell: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: keyValueInfo.key, for: indexPath) as? Cell else {
            fatalError()
        }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<Cell>(
        withIdentifier keyValueInfo: KeyValueInfo<String, Cell>
    ) -> Cell where Cell: UITableViewHeaderFooterView {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: keyValueInfo.rawValue) as? Cell else {
            fatalError()
        }
        return cell
    }
}
#endif
