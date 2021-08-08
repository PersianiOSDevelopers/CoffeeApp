import Foundation
protocol ExtraReopository {
    func getExtraByID(id : String) -> ExtraModel?
    func saveAllExtras(extras : [ExtraModel])-> Void
}
