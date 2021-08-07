//
//  ExtraModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
struct ExtraModel : Codable {
    let id : String
    let description : String
    let subSelections : [SelectionModel]
    enum CodingKeys : String , CodingKey{
        case id = "_id"
        case description = "name"
        case subSelections = "subselections"
    }
}
