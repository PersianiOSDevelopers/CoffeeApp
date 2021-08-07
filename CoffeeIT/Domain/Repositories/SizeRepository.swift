//
//  SizeRepository.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
protocol SizeReopository {
    func getSizeByID(id : String) -> SizeModel?
    func saveAllSizes(sizes : [SizeModel])-> Void
}
