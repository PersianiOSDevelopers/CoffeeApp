import UIKit

class SelectExtraViewModel {
    var section : Int = 0

    var isCollbsed = false{
        didSet{
            reloadState()
        }
    }
    let extra : ExtraModel
    var reloadState : () -> Void = {}
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