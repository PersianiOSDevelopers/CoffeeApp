import UIKit
import SimpleCheckbox

class ExtraChildTableViewCell: UITableViewCell {
    static let reuseAndNibIdentifier = "ExtraTableViewCell"
    @IBOutlet weak var checkBox: Checkbox!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var centerView: UIView!
    var checkboxDelegate : SelectCheckBoxDelegate?
    var indexPath : IndexPath?
    var vm : ExtraChildViewModel?{
        didSet{
            loadData()
        }
    }
    /// load data from view model
    func loadData(){
        if let vm = vm{
            nameLbl.text = vm.name
        }
    }
    @IBAction func checkBox_Tapped(_ sender: Checkbox) {
        if let vm = vm{
            checkboxDelegate?.selectCheckBoxAt(vm : vm , state: sender.isChecked)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    func setupUI(){
        centerView.layer.cornerRadius = 4
        checkBox.borderStyle = .circle
        checkBox.checkedBorderColor = UIColor.white
        checkBox.checkmarkColor = UIColor.white
        checkBox.checkmarkStyle = .tick
        checkBox.uncheckedBorderColor = UIColor.white
    }
}

protocol SelectCheckBoxDelegate {
    func selectCheckBoxAt(vm : ExtraChildViewModel , state : Bool)
}
