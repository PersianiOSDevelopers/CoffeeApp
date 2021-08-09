import UIKit

class ScanController: UIViewController , Storyboarded {
    weak var coordinator : MainCoordinator?
    @IBOutlet weak var underLineLbl: UnderlinedLabel!
    @IBOutlet weak var machineImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    var selectedStyle : StyleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        machineImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(image_Tapped))
        machineImageView.addGestureRecognizer(tapGesture)
        underLineLbl.text = "How does this work"
        titleLbl.isUserInteractionEnabled = true
        let backGesture = UITapGestureRecognizer.init(target: self, action: #selector(back_Tapped))
        titleLbl.addGestureRecognizer(backGesture)
    }
    @objc func image_Tapped(){
        if let selectedStyle = selectedStyle{
            coordinator?.goToSizes(selectedStyle: selectedStyle)
        }
    }
    @objc func back_Tapped(){
        coordinator?.navigationController.popViewController(animated: true)
    }
}
