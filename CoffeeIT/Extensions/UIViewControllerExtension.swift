import UIKit
extension UIViewController{
    func registerItemTableViewCell(tableView : UITableView){
        tableView.register(UINib.init(nibName: ItemTableViewCell.reuseIdentifierAndNibName , bundle: .main), forCellReuseIdentifier: ItemTableViewCell.reuseIdentifierAndNibName)
    }
}
