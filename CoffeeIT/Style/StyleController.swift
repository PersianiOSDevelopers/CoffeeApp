//
//  StyleController.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import UIKit

class StyleController: UIViewController  , Storyboarded{
    weak var coordinator : MainCoordinator?
    var vm : StyleViewModel?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = .none
        registerItemTableViewCell(tableView : tableView)
        vm?.updateHandler = tableView.reloadData
    }
    
    func fetchData(){
        vm?.getData()
    }
    
}
extension StyleController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.stylesArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifierAndNibName, for: indexPath) as! ItemTableViewCell
        cell.vm = vm?.stylesArray[indexPath.row]
        return cell
    }
}

extension UIViewController{
    func registerItemTableViewCell(tableView : UITableView){
        tableView.register(UINib.init(nibName: ItemTableViewCell.reuseIdentifierAndNibName , bundle: .main), forCellReuseIdentifier: ItemTableViewCell.reuseIdentifierAndNibName)
    }
}
