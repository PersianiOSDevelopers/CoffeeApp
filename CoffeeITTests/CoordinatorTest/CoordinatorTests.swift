import XCTest
@testable import CoffeeIT
class CoordinatorTests: XCTestCase {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var sut : MainCoordinator!
    let navController = UINavigationController.init()
    var testStyle = StyleModel.init(id: "2", name: "latte", sizes: ["1"], extras: ["1"])
    override func setUpWithError() throws {
        appDelegate?.window = UIWindow.init(frame: UIScreen.main.bounds)
        appDelegate?.window?.rootViewController = navController
        appDelegate?.window?.makeKeyAndVisible()
        sut = MainCoordinator.init(navigationController: navController)
    }

    func testStartGetInitCorrectly(){
        sut.start()
        XCTAssert(sut.navigationController.topViewController is StyleController)
        let styleController = sut.navigationController.topViewController as! StyleController
        XCTAssertNotNil(styleController.vm)
        XCTAssert(styleController.coordinator == sut)
    }
    func testGoToScan(){
        sut.goToScan(selectedStyle: testStyle)
        XCTAssert(sut.navigationController.topViewController is ScanController)
        let scanController = sut.navigationController.topViewController as! ScanController
        XCTAssert(scanController.coordinator == sut)
        XCTAssertNotNil(scanController.selectedStyle)
    }
    func testGoToSizes(){
        sut.goToSizes(selectedStyle: testStyle)
        XCTAssert(sut.navigationController.topViewController is SizeController)
        let sizeController = sut.navigationController.topViewController as! SizeController
        XCTAssert(sizeController.coordinator == sut)
    }
    func testGoToExtras(){
        sut.goToExtras(selectedStyle: testStyle)
        XCTAssert(sut.navigationController.topViewController is ExtraController)
        let extraController = sut.navigationController.topViewController as! ExtraController
        XCTAssert(extraController.coordinator == sut)
    }
}

