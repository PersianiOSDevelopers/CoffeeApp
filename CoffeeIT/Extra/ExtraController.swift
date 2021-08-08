//
//  ExtraController.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import UIKit

class ExtraController: UIViewController , Storyboarded {

    var vm : ExtraViewModel?
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
        vm?.updateHandler = tableView.reloadData
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(back_Tapped))
        backStackView.addGestureRecognizer(tapGesture)
        registerTableViewCellAndHeader()
    }
    func fetchData(){
        vm?.getData()
    }
    @objc func back_Tapped(){
        coordinator.navigationController.popViewController(animated: true)
    }
    func registerTableViewCellAndHeader(){
        tableView.register(ExtraHeaderView.nib, forHeaderFooterViewReuseIdentifier: ExtraHeaderView.reuseIdentifier)
        tableView.register(UINib.init(nibName: ExtraTableViewCell.reuseAndNibIdentifier, bundle: .main), forCellReuseIdentifier:  ExtraTableViewCell.reuseAndNibIdentifier)
    }
    func reloadTableAtSection(section : Int){
        print(vm?.extraArray[section].isCollbsed)
        tableView.reloadSections([section], with: .automatic)
    }
}
extension ExtraController : UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm?.extraArray.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = vm else {
            return 0
        }
        if vm.extraArray[section].isCollbsed {
            return vm.extraArray[section].selections.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExtraTableViewCell.reuseAndNibIdentifier, for: indexPath) as! ExtraTableViewCell
        if let selection = vm?.extraArray[indexPath.section].selections[indexPath.row]{
            cell.vm = ExtraCellViewModel.init(selection: selection)
        }
        return cell
    }
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 104
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ExtraHeaderView.reuseIdentifier) as! ExtraHeaderView
        header.vm = vm?.extraArray[section]
        header.vm?.section = section
        header.vm?.reloadSection = reloadTableAtSection(section:)
        return header
    }
}
