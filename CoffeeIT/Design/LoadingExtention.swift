import Foundation
import UIKit

class SharedActivityIndicator {
    private init() {
    }
    static let sharedInstance: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        indicator.hidesWhenStopped = true
        return indicator
    }()
}

extension UIViewController {
    var indicator: UIActivityIndicatorView {
        SharedActivityIndicator.sharedInstance.center = view.center
        self.view.addSubview(SharedActivityIndicator.sharedInstance)
        self.view.bringSubviewToFront(SharedActivityIndicator.sharedInstance)
        return SharedActivityIndicator.sharedInstance
    }
    func startLoading() {
        let backDropView: BackDropView = BackDropView()
        backDropView.frame = self.view.frame
        backDropView.center = self.view.center
        self.view.addSubview(backDropView)
        indicator.startAnimating()
    }
    func stopLoading () {
        for UiItem in self.view.subviews where UiItem is BackDropView {
            UiItem.removeFromSuperview()
        }
        if SharedActivityIndicator.sharedInstance.isAnimating {
            SharedActivityIndicator.sharedInstance.stopAnimating()
            SharedActivityIndicator.sharedInstance.removeFromSuperview()
        }
    }
}
