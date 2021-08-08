import Foundation

class ExtraViewModel{
    let extraRepo : ExtraReopository
    let selectedStyle : StyleModel
    var updateHandler: () -> Void = {}
    var extraArray = [ExtraParentViewModel]()
    
    init(selectedStyle : StyleModel , extraRepo : ExtraReopository = ExtraServices()){
        self.extraRepo = extraRepo
        self.selectedStyle = selectedStyle
    }
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
