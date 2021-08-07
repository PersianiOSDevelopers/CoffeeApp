import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(storyboradName : String , storyboardID : String) -> Self
}

extension Storyboarded where Self : UIViewController{
    /// instantiate a view controller from the storyboard name and storyboard id you provide in the input
    /// - Parameters:
    ///   - storyboradName: storyboard name to instantiate view controller from
    ///   - storyboardID: storyboard id to instantiate view controller from
    /// - Returns: view controller
    static func instantiate(storyboradName : String , storyboardID : String) -> Self{
        let storyboard = UIStoryboard(name: storyboradName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardID ) as! Self
    }
}
