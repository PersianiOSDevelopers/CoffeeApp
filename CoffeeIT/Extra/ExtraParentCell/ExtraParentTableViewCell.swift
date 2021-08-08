import UIKit

/// this table view cell used for displaying an Extra model object inside this table view cell there is a table view for showing selections of the Extra model
class ExtraParentTableViewCell: UITableViewCell {
    static let reuseIdentifier = "SelectExtraTableViewCell"
    var indexPath : IndexPath!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var innerStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lineView: UIView!
    var reloadDelegate : ReloadTableViewIndexPathDelegate?
    var selectedItem : ExtraChildViewModel?
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: .main)
    }
    var vm : ExtraParentViewModel?{
        didSet{
            loadData()
        }
    }
    func loadData(){
        if let vm = vm{
            itemNameLbl.text = vm.name
            if let image = vm.image{
                itemImageView.isHidden = false
                itemImageView.image = image
            }else{
                itemImageView.isHidden = true
            }
            setupUI()
        }
    }
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(cell_Tapped))
        self.addGestureRecognizer(tapGesture)
    }
    fileprivate func registerTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func setupUI(){
        addTapGesture()
        registerTableViewDelegates()
        vm?.reloadState = showState
        addShadow()
        backView.layer.cornerRadius = 4
        showState()
    }
    func showState(){
        if vm?.isCollapsed ?? false{
            tableView.isHidden = false
            lineView.isHidden = false
        }else{
            tableView.isHidden = true
            lineView.isHidden = true
        }
        tableView.reloadData()
        reloadDelegate?.reloadAt(indexPath : indexPath)
    }
    @objc func cell_Tapped(){
        vm?.isCollapsed.toggle()
    }
    private func addShadow(){
        self.backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        self.backView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        self.backView.layer.shadowRadius = 4
    }
}

extension ExtraParentTableViewCell : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.selections.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExtraChildTableViewCell.reuseAndNibIdentifier, for: indexPath) as! ExtraChildTableViewCell
        if let selection = vm?.selections[indexPath.row]{
            cell.vm = ExtraChildViewModel.init(selection: selection)
            if selectedItem?.selection.id == selection.id{
                cell.checkBox.isChecked = true
            }else{
                cell.checkBox.isChecked = false
            }
        }
        cell.checkboxDelegate = self
        return cell
    }
}
extension ExtraParentTableViewCell : SelectCheckBoxDelegate{
    func selectCheckBoxAt(vm : ExtraChildViewModel, state: Bool) {
        if state {
            selectedItem = vm
            tableView.reloadData()
        }else{
            selectedItem = nil
        }
    }
}
protocol ReloadTableViewIndexPathDelegate {
    func reloadAt(indexPath : IndexPath)
}
