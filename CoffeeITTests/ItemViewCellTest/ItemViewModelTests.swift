import XCTest
@testable import CoffeeIT

class ItemViewModelTests: XCTestCase {
    var sut : ItemViewModel!
    let style = StyleModel.init(id: "", name: "latte", sizes: [], extras: [])
    let size = SizeModel.init(id: "", name: "small")
    
    func testInitWithStyle(){
        sut = ItemViewModel.init(style: style)
        XCTAssert(sut.name == style.name)
    }
    func testInitWithSize(){
        sut = ItemViewModel.init(size: size)
        XCTAssert(sut.name == size.name)
    }
}
