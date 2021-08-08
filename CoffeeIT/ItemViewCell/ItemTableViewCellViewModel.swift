import Foundation
import UIKit

struct ItemTableViewCellViewModel {
    let name : String
    let image : UIImage?

    init(style : StyleModel){
        self.name = style.name
        self.image = UIImage(named: style.name.lowercased())
    }
    init(size : SizeModel){
        self.name = size.name
        self.image = UIImage(named: size.name.lowercased())
    }
}
