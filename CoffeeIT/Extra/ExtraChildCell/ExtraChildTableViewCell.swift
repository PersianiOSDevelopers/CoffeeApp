import UIKit
import SimpleCheckbox

class ExtraChildTableViewCell: UITableViewCell {
    static let reuseAndNibIdentifier = "ExtraTableViewCell"
    @IBOutlet weak var checkBox: Checkbox!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var centerView: UIView!
    
    var vm : ExtraChildViewModel?{
        didSet{
            loadData()
        }
    }
    func loadData(){
        if let vm = vm{
            nameLbl.text = vm.name
        }
    }
    @IBAction func checkBox_Tapped(_ sender: Checkbox) {
        
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


