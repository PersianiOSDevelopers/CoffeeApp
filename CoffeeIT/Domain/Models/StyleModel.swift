//
//  StyleModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
struct StyleModel : Codable {
    let id : String
    let name : String
    let sizes : [String]
    let extras : [String]
}

struct SizeModel : Codable {
    let id : String
    let name : String
}

struct ExtraModel : Codable {
    let id : String
    let description : String
    let subSelections : [SelectionModel]
}

struct SelectionModel : Codable {
    let id : String
    let name : String
}
