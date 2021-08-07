//
//  ExtraRepository.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
protocol ExtraReopository {
    func getExtraByID(id : String) -> ExtraModel?
    func saveAllExtras(extras : [ExtraModel])-> Void
}
