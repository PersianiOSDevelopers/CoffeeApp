import Foundation
class ExtraServices : ExtraReopository{
    let objectName = "extraObject"
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let userDef = UserDefaults.init(suiteName: "extra")
    
    /// return extra object with provided id in the input
    /// - Parameter id: desired id
    /// - Returns: extra model with input id
    func getExtraByID(id: String) -> ExtraModel? {
        if let json = userDef?.object(forKey: objectName) as? Data{
            if let extraArray = try? decoder.decode([ExtraModel].self, from: json){
                return extraArray.first(where: { $0.id == id})
            }
        }
        return nil
    }
    /// save all extra  array to  UserDefaults
    /// - Parameter extras: extras array to save
    func saveAllExtras(extras: [ExtraModel]) {
        if let encodeObject = try? encoder.encode(extras){
            userDef?.set(encodeObject, forKey: objectName)
        }
    }
}
