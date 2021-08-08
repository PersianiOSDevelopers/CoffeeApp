import Foundation
struct CoffeeMachineModel : Codable{
    let id : String
    let types : [StyleModel]?
    let sizes : [SizeModel]?
    let extras : [ExtraModel]?
    enum CodingKeys : String , CodingKey{
        case id = "_id"
        case types
        case sizes
        case extras
    }
}
