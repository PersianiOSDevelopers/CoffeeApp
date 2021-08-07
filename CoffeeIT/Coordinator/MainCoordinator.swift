import Foundation
import UIKit

class MainCoordinator: NSObject , Coordinator  , UINavigationControllerDelegate{
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// starts handling navigation of app and push home controller to navigation controller
    func start() {
        navigationController.setNavigationBarHidden(true, animated: true)
//        let viewModel = HomeViewModel.init()
//        let homeController = HomeController.instantiate(storyboradName: "Home", storyboardID: "Home")
//        homeController.viewModel = viewModel
//
//        homeController.coordinator = self
//        navigationController.pushViewController(homeController, animated: true)
    }
    
}
