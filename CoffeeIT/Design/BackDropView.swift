import Foundation
import UIKit

class BackDropView : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackDrop()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBackDrop()
    }
    func setupBackDrop(){        
        self.backgroundColor = #colorLiteral(red: 0.2384076209, green: 0.2384076209, blue: 0.2384076209, alpha: 0.5)
    }
}
