//
//  StyleRepository.swift
//  CoffeeIT
//
//  Created by Amir Tutunchi on 8/7/21.
//

import Foundation
protocol CoffeeMachineRepository {
    func getMenu(machineID : String , result : @escaping (Result<CoffeeMachineModel , Error>)->Void)
}
