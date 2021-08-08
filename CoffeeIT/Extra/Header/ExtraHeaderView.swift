//
//  ExtraHeaderView.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import UIKit
class ExtraHeaderView: UITableViewHeaderFooterView {
    static let reuseIdentifier = "ExtraHeaderView"
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        setupUI()
    }
    var vm : ExtraHeaderViewModel?{
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
        }
    }
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: .main)
    }
    
    private func setupUI(){
        backView.layer.cornerRadius = 4
        addShadow()
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(cell_Tapped))
        self.addGestureRecognizer(tapGesture)
    }
    @objc func cell_Tapped(){
        vm?.isCollbsed.toggle()
    }
    private func addShadow(){
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        backView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        backView.layer.shadowRadius = 4
    }
}
