//
//  ExtraCellViewModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import Foundation
struct ExtraCellViewModel {
    let selection : SelectionModel
    var name : String{
        return selection.name
    }
}
