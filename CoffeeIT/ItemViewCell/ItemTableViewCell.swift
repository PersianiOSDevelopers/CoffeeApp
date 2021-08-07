//
//  ItemTableViewCell.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let reuseIdentifierAndNibName = "ItemTableViewCell"
    var vm : ItemTableViewCellViewModel?{
        didSet{
            loadViewModel()
        }
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    private func loadViewModel(){
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
    private func setupUI(){
        backView.layer.cornerRadius = 4
        addShadow()
    }
    private func addShadow(){
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        backView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        backView.layer.shadowRadius = 4
    }
}
