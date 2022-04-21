import Foundation

class ExtraViewModel{
    let extraRepo : ExtraRepository
    let selectedStyle : StyleModel
    var updateHandler: () -> Void = {}
    var extraArray = [ExtraParentViewModel]()
    
    /// initialize extra viewmodel
    /// - Parameters:
    ///   - selectedStyle: selected coffee style
    ///   - extraRepo: desired extra service implementation
    init(selectedStyle : StyleModel , extraRepo : ExtraRepository = ExtraServices()){
        self.extraRepo = extraRepo
        self.selectedStyle = selectedStyle
    }
    /// use this function to retrieve the extra element within the selected coffee style
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
