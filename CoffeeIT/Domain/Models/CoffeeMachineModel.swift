//
//  CoffeeMachineModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
struct CoffeeMachineModel : Codable{
    let id : String
    let types : [StyleModel]?
    let sizes : [SizeModel]?
    let extras : [ExtraModel]?
    enum CodingKeys : String , CodingKey{
        case id = "_id"
        case types
        case sizes
        case extras
    }
}
