import Foundation
struct StyleModel : Codable {
    let id : String
    let name : String
    let sizes : [String]
    let extras : [String]
    enum CodingKeys : String , CodingKey{
        case id = "_id"
        case name
        case sizes
        case extras
    }
}
