//
//  StyleViewModel.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
class StyleViewModel {
    var items = [ItemTableViewCellViewModel]()
    var styles = [StyleModel](){
        didSet{
            items = styles.map{ item in
                ItemTableViewCellViewModel.init(style: item)
            }
        }
    }
    let sizeRepo : SizeReopository
    let extraRepo : ExtraReopository
    let coffeeMachineRepo : CoffeeMachineRepository
    
    init(sizeRepo : SizeReopository = SizeServices() , extrarepo : ExtraReopository = ExtraServices() , coffeeMachineRepo : CoffeeMachineRepository = RemoteCoffeeMachineService()){
        self.sizeRepo = sizeRepo
        self.extraRepo = extrarepo
        self.coffeeMachineRepo = coffeeMachineRepo
    }
    
    var updateHandler: () -> Void = {}
    
    func getData(){
        coffeeMachineRepo.getMenu(machineID: "60ba1ab72e35f2d9c786c610") { [weak self] (res : Result<CoffeeMachineModel, Error>) in
            switch res{
            case.success(let machine):
                if let extras = machine.extras{
                    self?.extraRepo.saveAllExtras(extras: extras)
                }
                if let sizes = machine.sizes{
                    self?.sizeRepo.saveAllSizes(sizes: sizes)
                }
                self?.styles = machine.types ?? []
                DispatchQueue.main.async {
                    self?.updateHandler()
                }
            case.failure(let err):
                print(err)
            }
        }
    }
}
