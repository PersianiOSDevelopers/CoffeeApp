//
//  RemoteStyleService.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
class RemoteCoffeeMachineService : CoffeeMachineRepository{
    var apiCaller = ServiceLayer.sharedInstance
    func getMenu(machineID : String , result : @escaping (Result<CoffeeMachineModel , Error>)->Void){
        apiCaller.request(router: Router.coffeeMachine(id: machineID)) {  (res  : Result< CoffeeMachineModel , Error>) in
            result(res)
        }
    }
    
}
