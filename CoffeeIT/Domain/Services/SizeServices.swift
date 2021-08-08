import Foundation
class SizeServices : SizeReopository{
    let objectName = "sizeObject"
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let userDef = UserDefaults.init(suiteName: "sizes")
    
    /// return size object with provided id in the input
    /// - Parameter id: desired id
    /// - Returns: size model object
    func getSizeByID(id: String) -> SizeModel? {
        if let json = userDef?.object(forKey: objectName) as? Data{
            if let sizeArray = try? decoder.decode([SizeModel].self, from: json){
                return sizeArray.first(where: { $0.id == id})
            }
        }
        return nil
    }
    /// save all size model array to use UserDefaults
    /// - Parameter sizes: size array
    func saveAllSizes(sizes: [SizeModel]) {
        if let encodeObject = try? encoder.encode(sizes){
            userDef?.set(encodeObject, forKey: objectName)
        }
    }
}
