import UIKit
extension UIViewController{
    /// this function register ItemTableViewCell to the table view passed as input
    /// - Parameter tableView: the table view object you want to register ItemTableViewCell to
    func registerItemTableViewCell(tableView : UITableView){
        tableView.register(UINib.init(nibName: ItemTableViewCell.reuseIdentifierAndNibName , bundle: .main), forCellReuseIdentifier: ItemTableViewCell.reuseIdentifierAndNibName)
    }
}
