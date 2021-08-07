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
        let viewModel = StyleViewModel.init()
        let styleController = StyleController.instantiate(storyboradName: "Style", storyboardID: "Style")
        styleController.vm = viewModel
        styleController.coordinator = self
        navigationController.pushViewController(styleController, animated: true)
    }
    
}
