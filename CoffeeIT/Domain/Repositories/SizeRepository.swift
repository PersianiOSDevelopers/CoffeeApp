import Foundation
protocol SizeReopository {
    func getSizeByID(id : String) -> SizeModel?
    func saveAllSizes(sizes : [SizeModel])-> Void
}
