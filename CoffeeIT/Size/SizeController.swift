//
//  SizeController.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import UIKit

class SizeController: UIViewController , Storyboarded {
    var vm : SizeViewModel?
    
    weak var coordinator : MainCoordinator!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        self.registerItemTableViewCell(tableView: tableView)
        vm?.updateHandler = tableView.reloadData
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(back_Tapped))
        backStackView.addGestureRecognizer(tapGesture)
    }
    func fetchData(){
        vm?.getSizes()
    }
    @objc func back_Tapped(){
        coordinator.navigationController.popViewController(animated: true)
    }
}
extension SizeController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.sizesArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifierAndNibName, for: indexPath) as! ItemTableViewCell
        cell.vm = vm?.sizesArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedStyle = vm?.selectedStyle{
            coordinator?.goToExtras(selectedStyle: selectedStyle)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
