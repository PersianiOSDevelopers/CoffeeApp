//
//  ItemTableViewCellViewModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
import UIKit

struct ItemTableViewCellViewModel {
    let name : String
    let image : UIImage?
    init(name : String , image : UIImage? = nil) {
        self.name = name
        self.image = image
    }
    init(style : StyleModel){
        self.name = style.name
        self.image = UIImage(named: style.name.lowercased())
    }
}
