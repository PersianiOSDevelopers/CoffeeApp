import XCTest
@testable import CoffeeIT

class SizeServicesTests: XCTestCase {

    let sut = SizeServices()
    let sizeArraySample = [SizeModel.init(id: "123", name: "big")]
    
    func testSaveAndGetAllSizes(){
        sut.saveAllSizes(sizes: sizeArraySample)
        XCTAssertNotNil(sut.userDef?.object(forKey: sut.objectName) as? Data)
        XCTAssertEqual(sut.userDef?.object(forKey: sut.objectName) as? Data, try? sut.encoder.encode(sizeArraySample) )
    }

}
