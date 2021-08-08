import Foundation
protocol CoffeeMachineRepository {
    func getMenu(machineID : String , result : @escaping (Result<CoffeeMachineModel , Error>)->Void)
}
