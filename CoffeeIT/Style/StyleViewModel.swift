import Foundation
class StyleViewModel {
    var items = [ItemTableViewCellViewModel]()
    let sizeRepo : SizeReopository
    let extraRepo : ExtraReopository
    let coffeeMachineRepo : CoffeeMachineRepository
    var updateHandler: () -> Void = {}
    var styles = [StyleModel](){
        didSet{
            items = styles.map{ item in
                ItemTableViewCellViewModel.init(style: item)
            }
        }
    }
    init(sizeRepo : SizeReopository = SizeServices() , extrarepo : ExtraReopository = ExtraServices() , coffeeMachineRepo : CoffeeMachineRepository = RemoteCoffeeMachineService()){
        self.sizeRepo = sizeRepo
        self.extraRepo = extrarepo
        self.coffeeMachineRepo = coffeeMachineRepo
    }
    func getData(completion : @escaping ()-> Void = {}){
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
                    completion()
                }
            case.failure(let err):
                print(err)
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
}
