import Foundation

final class StyleViewModel {
    private(set) var items = [ItemViewModel]()
    private let sizeRepo: SizeRepository
    private let extraRepo: ExtraRepository
    private let coffeeMachineRepo: CoffeeMachineRepository
    var updateHandler: () -> Void = { } //it should embed in a wrapper
    var styles = [StyleModel]() {
        didSet {
            items = styles.map { item in
                ItemViewModel.init(style: item)
            }
        }
    }
    init(
        sizeRepo: SizeRepository = SizeServices(),
        extrarepo: ExtraRepository = ExtraServices(),
        coffeeMachineRepo: CoffeeMachineRepository = RemoteCoffeeMachineService()
    ) {
        self.sizeRepo = sizeRepo
        self.extraRepo = extrarepo
        self.coffeeMachineRepo = coffeeMachineRepo
    }
    
    func getCoffeeMachineData(
        machineId: String = "60ba1ab72e35f2d9c786c610", // this should not be in code
        completion: @escaping (_ err : Error?) -> Void = { _ in }
    ) {
        coffeeMachineRepo.getMenu(machineID: machineId) { [weak self] (res : Result<CoffeeMachineModel, Error> )  in
            switch res{
            case.success(let machine):
                /// cache extras
                machine.extras.flatMap(self!.extraRepo.saveAllExtras(extras:))
//                if let extras = machine.extras {
//                    self?.extraRepo.saveAllExtras(extras: extras)
//                }
                /// cache sizes
                if let sizes = machine.sizes{
                    self?.sizeRepo.saveAllSizes(sizes: sizes)
                }
                self?.styles = machine.types ?? []
                self?.updateHandler()
                completion(nil)
            case.failure(let err):
                completion(err)
            }
        }
    }
}
// Review until here
