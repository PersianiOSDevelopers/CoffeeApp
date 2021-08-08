//
//  ExtraHeaderViewModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import UIKit

class ExtraHeaderViewModel {
    var section : Int = 0

    var isCollbsed = false{
        didSet{
            reloadSection(section)
        }
    }
    let extra : ExtraModel
    var reloadSection : (_ secion : Int) -> Void = {_ in }
    init(extra : ExtraModel){
        self.extra = extra
    }
    var name : String{
        return extra.name
    }
    var image : UIImage?{
        return UIImage.init(named: extra.name.lowercased())
    }
    var selections : [SelectionModel]{
        return extra.subSelections
    }
}
