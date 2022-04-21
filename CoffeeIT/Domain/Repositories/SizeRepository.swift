import Foundation
protocol SizeRepository {
    func getSizeByID(id : String) -> SizeModel?
    func saveAllSizes(sizes : [SizeModel])-> Void
}
