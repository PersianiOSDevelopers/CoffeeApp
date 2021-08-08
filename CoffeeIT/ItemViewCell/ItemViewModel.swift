import Foundation
import UIKit

struct ItemViewModel {
    let name : String
    let image : UIImage?
    
    /// initialize an ItemViewModel from a style model object
    /// - Parameter style: style model object
    init(style : StyleModel){
        self.name = style.name
        self.image = UIImage(named: style.name.lowercased())
    }
    /// initialize an ItemViewModel from a size model object
    /// - Parameter size: size model object
    init(size : SizeModel){
        self.name = size.name
        self.image = UIImage(named: size.name.lowercased())
    }
}
