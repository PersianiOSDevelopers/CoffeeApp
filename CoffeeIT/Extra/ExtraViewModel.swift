//
//  ExtraViewModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/8/21.
//

import Foundation

class ExtraViewModel{
    let extraRepo : ExtraReopository
    let selectedStyle : StyleModel
    var updateHandler: () -> Void = {}

    init(selectedStyle : StyleModel , extraRepo : ExtraReopository = ExtraServices()){
        self.extraRepo = extraRepo
        self.selectedStyle = selectedStyle
    }
    
    var extraArray = [ExtraParentViewModel]()
    
    func getData(){
        extraArray = []
        for item in selectedStyle.extras{
            if let extra = extraRepo.getExtraByID(id: item){
                extraArray.append(ExtraParentViewModel.init(extra: extra))
            }
        }
        updateHandler()
    }
}
