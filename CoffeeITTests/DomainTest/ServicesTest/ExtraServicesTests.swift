import XCTest
@testable import CoffeeIT
class ExtraServicesTests: XCTestCase {
    let sut = ExtraServices()
    let extraArraySample = [ExtraModel.init(id: "", name: "", subSelections: [SelectionModel.init(id: "aa", name: "sadsa")])]
    
    func testSaveAllExtras(){
        sut.saveAllExtras(extras: extraArraySample)
        XCTAssertNotNil(sut.userDef?.object(forKey: sut.objectName) as? Data)
        XCTAssertEqual(sut.userDef?.object(forKey: sut.objectName) as? Data, try? sut.encoder.encode(extraArraySample) )
    }
}
