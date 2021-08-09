import XCTest
@testable import CoffeeIT
class StyleControllerTests: XCTestCase {
    var coordinator : MainCoordinator!
    var sut : StyleController!
    
    override func setUpWithError() throws {
        coordinator = MainCoordinator.init(navigationController: UINavigationController.init())
        coordinator.start()
        sut = (coordinator.navigationController.topViewController as! StyleController)
        let _ = sut.view
    }
    func testInitCorrectly(){
        XCTAssertNotNil(sut.vm)
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.vm?.updateHandler)
    }
    func testLoadDataCorrectly(){
        loadCoffee()
        XCTAssert(sut.tableView.numberOfRows(inSection: 0) > 0)
        XCTAssert(sut.vm?.items[0].name == "latte")
    }
    // Helper function to select coffee from table view
    func loadCoffee(){
        sut.vm = StyleViewModel.init(sizeRepo: SizeServices(), extrarepo: ExtraServices(), coffeeMachineRepo: fakeCoffeeMachineRepo())
        sut.fetchData()
        sut.tableView.reloadData()
    }
}
class fakeCoffeeMachineRepo : CoffeeMachineRepository{
    func getMenu(machineID: String, result: @escaping (Result<CoffeeMachineModel, Error>) -> Void) {
        result(.success(CoffeeMachineModel.init(id: "", types: [StyleModel.init(id: "2", name: "latte", sizes: ["1"], extras: ["1"])], sizes: [SizeModel.init(id: "1", name: "big")], extras: [ExtraModel.init(id: "1", name: "sugar", subSelections: [SelectionModel.init(id: "3", name: "a lot")])])))
    }
}
