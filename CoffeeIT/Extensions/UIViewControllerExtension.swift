//
//  UIViewControllerExtension.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import UIKit
extension UIViewController{
    func registerItemTableViewCell(tableView : UITableView){
        tableView.register(UINib.init(nibName: ItemTableViewCell.reuseIdentifierAndNibName , bundle: .main), forCellReuseIdentifier: ItemTableViewCell.reuseIdentifierAndNibName)
    }
}
