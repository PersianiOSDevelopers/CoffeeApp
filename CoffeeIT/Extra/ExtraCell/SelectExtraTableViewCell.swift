//
//  SelectExtraTableViewCell.swift
//  CoffeeIT
//
//  Created by kdeveloper1 on 8/8/21.
//

import UIKit

class SelectExtraTableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    static let reuseIdentifier = "SelectExtraTableViewCell"
    var indexPath : IndexPath!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var innerStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lineView: UIView!
    weak var parent : ExtraController?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var vm : SelectExtraViewModel?{
        didSet{
            loadData()
        }
    }
    func loadData(){
        if let vm = vm{
            itemNameLbl.text = vm.name
            if let image = vm.image{
                itemImageView.isHidden = false
                itemImageView.image = image
            }else{
                itemImageView.isHidden = true
            }
            showState()
            vm.reloadState = showState
            setupUI()
        }
    }
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: .main)
    }
    
    private func setupUI(){
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(cell_Tapped))
        self.addGestureRecognizer(tapGesture)
        tableView.delegate = self
        tableView.dataSource = self
        vm?.reloadState = showState
        addShadow()
        backView.layer.cornerRadius = 4
    }
    func showState(){
        if vm?.isCollbsed ?? false{
            tableView.isHidden = false
            lineView.isHidden = false
        }else{
            tableView.isHidden = true
            lineView.isHidden = true
        }
        tableView.reloadData()
        parent?.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    @objc func cell_Tapped(){
        vm?.isCollbsed.toggle()
    }
    private func addShadow(){
        self.backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        self.backView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        self.backView.layer.shadowRadius = 4
    }
}
extension SelectExtraTableViewCell : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.selections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExtraTableViewCell.reuseAndNibIdentifier, for: indexPath) as! ExtraTableViewCell
        if let selection = vm?.selections[indexPath.row]{
            cell.vm = ExtraCellViewModel.init(selection: selection)
        }
        return cell
    }
    
}
