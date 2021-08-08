import Foundation
class SizeViewModel {
    var sizesArray = [ItemViewModel]()
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
                sizesArray.append(ItemViewModel.init(size: selectedSize))
            }
        }
        updateHandler()
    }
}
