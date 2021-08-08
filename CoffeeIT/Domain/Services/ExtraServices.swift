import Foundation
class ExtraServices : ExtraReopository{
    let objectName = "extraObject"
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let userDef = UserDefaults.init(suiteName: "extra")
    
    func getExtraByID(id: String) -> ExtraModel? {
        if let json = userDef?.object(forKey: objectName) as? Data{
            if let extraArray = try? decoder.decode([ExtraModel].self, from: json){
                return extraArray.first(where: { $0.id == id})
            }
        }
        return nil
    }
    func saveAllExtras(extras: [ExtraModel]) {
        if let encodeObject = try? encoder.encode(extras){
            userDef?.set(encodeObject, forKey: objectName)
        }
    }
}
