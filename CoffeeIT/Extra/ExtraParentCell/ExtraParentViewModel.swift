import UIKit

class ExtraParentViewModel {
    var section : Int = 0
    let extra : ExtraModel
    var reloadState : () -> Void = {}
    
    var isCollapsed = false{
        didSet{
            reloadState()
        }
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
    init(extra : ExtraModel){
        self.extra = extra
    }
}
