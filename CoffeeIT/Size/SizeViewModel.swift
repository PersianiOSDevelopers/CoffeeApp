//
//  SizeViewModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import Foundation
class SizeViewModel {
    var sizesArray = [ItemTableViewCellViewModel]()
    let sizeRepo : SizeReopository
    var updateHandler: () -> Void = {}
    let selectedStyle : StyleModel
    init(sizeRepo :SizeReopository = SizeServices() , selectedStyle : StyleModel ){
        self.selectedStyle = selectedStyle
        self.sizeRepo = sizeRepo
    }
    
    func getSizes() {
        sizesArray = []
        for item in selectedStyle.sizes{
            if let selectedSize = sizeRepo.getSizeByID(id: item){
                sizesArray.append(ItemTableViewCellViewModel.init(size: selectedSize))
            }
        }
        updateHandler()
    }
}
