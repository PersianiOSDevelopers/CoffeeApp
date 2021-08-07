//
//  SizeModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
struct SizeModel : Codable {
    let id : String
    let name : String
    enum CodingKeys : String , CodingKey{
        case id = "_id"
        case name
    }
}
