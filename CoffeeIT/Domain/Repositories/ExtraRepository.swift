import Foundation
protocol ExtraRepository {
    func getExtraByID(id : String) -> ExtraModel?
    func saveAllExtras(extras : [ExtraModel])-> Void
}
