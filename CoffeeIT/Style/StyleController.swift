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
    }
    
    func setupUI(){
        registerItemTableViewCell(tableView : tableView)
    }
    
}
extension StyleController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.stylesArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifierAndNibName, for: indexPath) as! ItemTableViewCell
        return cell
    }
}

extension UIViewController{
    func registerItemTableViewCell(tableView : UITableView){
        tableView.register(UINib.init(nibName: ItemTableViewCell.reuseIdentifierAndNibName , bundle: .main), forCellReuseIdentifier: ItemTableViewCell.reuseIdentifierAndNibName)
    }
}
