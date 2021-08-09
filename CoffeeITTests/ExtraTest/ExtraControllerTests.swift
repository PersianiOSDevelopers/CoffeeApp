import XCTest
@testable import CoffeeIT

class ExtraControllerTests: XCTestCase {
    var coordinator : MainCoordinator!
    var sut : ExtraController!
    let testStyle = StyleModel.init(id: "2", name: "latte", sizes: ["1"], extras: ["1"])

    override func setUpWithError() throws {
        coordinator = MainCoordinator.init(navigationController: UINavigationController.init())
        coordinator.goToExtras(selectedStyle: testStyle)
        sut = (coordinator.navigationController.topViewController as! ExtraController)
        let _ = sut.view
    }
    override func tearDownWithError() throws {
        coordinator.navigationController.popViewController(animated: false)
    }
    func testGetInitCorrectly(){
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.vm?.updateHandler)
    }
}
