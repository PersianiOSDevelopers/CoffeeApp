import Foundation
enum Router {
    case coffeeMachine(id : String)
    
    var scheme: String {
        return "https"
    }
    var host: String {
        return "darkroastedbeans.coffeeit.nl"
    }
    var port : Int?{
        return nil
    }
    var path: String {
        switch self {
        case .coffeeMachine(let id):
            return "/coffee-machine/" + id
        }
    }
    var parameters: [URLQueryItem] {
        switch self {
            case .coffeeMachine:
                return []
        }
    }
    var bodyParams : Data? {
        switch self {
            case .coffeeMachine:
                return nil
        }
    }
    var method: String {
        switch self {
            case .coffeeMachine:
                return "GET"
        }
    }
}

