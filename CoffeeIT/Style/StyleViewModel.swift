import Foundation
class StyleViewModel {
    var items = [ItemViewModel]()
    let sizeRepo : SizeReopository
    let extraRepo : ExtraReopository
    let coffeeMachineRepo : CoffeeMachineRepository
    var updateHandler: () -> Void = {}
    var styles = [StyleModel](){
        didSet{
            items = styles.map{ item in
                ItemViewModel.init(style: item)
            }
        }
    }
    /// initialize style view model with coffee machine repository to get data from server and cache extra items and size of coffees with extra repository and coffee repository
    /// - Parameters:
    ///   - sizeRepo: desired size repository implementation
    ///   - extrarepo: desired extra repository implementation
    ///   - coffeeMachineRepo: desired coffeemachine repository implementation
    init(sizeRepo : SizeReopository = SizeServices() , extrarepo : ExtraReopository = ExtraServices() , coffeeMachineRepo : CoffeeMachineRepository = RemoteCoffeeMachineService()){
        self.sizeRepo = sizeRepo
        self.extraRepo = extrarepo
        self.coffeeMachineRepo = coffeeMachineRepo
    }
    /// get coffee machine data and cache it
    /// - Parameters:
    ///   - machineId: machine id (provided for future uses :D)
    ///   - completion: completion that data received completely
    func getData(machineId : String = "60ba1ab72e35f2d9c786c610" , completion : @escaping (_ err : Error? )-> Void = {_ in })  {
        coffeeMachineRepo.getMenu(machineID: machineId)  { [weak self]  (res : Result<CoffeeMachineModel, Error> )  in
            switch res{
            case.success(let machine):
                if let extras = machine.extras{
                    self?.extraRepo.saveAllExtras(extras: extras)
                }
                if let sizes = machine.sizes{
                    self?.sizeRepo.saveAllSizes(sizes: sizes)
                }
                self?.styles = machine.types ?? []
                self?.updateHandler()
                completion(nil)
            case.failure(let err):
                print(err)
                completion(err)
            }
        }
    }
}
