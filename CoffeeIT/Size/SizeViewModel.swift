import Foundation
class SizeViewModel {
    var sizesArray = [ItemViewModel]()
    let sizeRepo : SizeReopository
    var updateHandler: () -> Void = {}
    let selectedStyle : StyleModel
    
    /// initialize  size view model
    /// - Parameters:
    ///   - sizeRepo: desired size service implementation
    ///   - selectedStyle: selected coffee style
    init(sizeRepo :SizeReopository = SizeServices() , selectedStyle : StyleModel ){
        self.selectedStyle = selectedStyle
        self.sizeRepo = sizeRepo
    }
    /// use this function to retrieve the size of the selected coffee style
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
