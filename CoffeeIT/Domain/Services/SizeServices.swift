import Foundation
class SizeServices : SizeReopository{
    let objectName = "sizeObject"
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let userDef = UserDefaults.init(suiteName: "sizes")
    
    func getSizeByID(id: String) -> SizeModel? {
        if let json = userDef?.object(forKey: objectName) as? Data{
            if let sizeArray = try? decoder.decode([SizeModel].self, from: json){
                return sizeArray.first(where: { $0.id == id})
            }
        }
        return nil
    }
    func saveAllSizes(sizes: [SizeModel]) {
        if let encodeObject = try? encoder.encode(sizes){
            userDef?.set(encodeObject, forKey: objectName)
        }
    }
}
