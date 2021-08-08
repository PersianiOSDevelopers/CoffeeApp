import Foundation
enum ServiceError : LocalizedError{
    case badHTTPStatus(status : Int , message : String?)
    case badToken(message : String?)
    case invalidResponse
}
struct ErrorResponse : Codable{
    let message : String
    enum CodingKeys : String , CodingKey{
        case message = "Message"
    }
}
