import UIKit

class ExtraController: UIViewController , Storyboarded {
    var vm : ExtraViewModel?
    weak var coordinator : MainCoordinator!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backStackView: UIStackView!
    let collapsedSize = 110
    let extraBottomSpace = 24
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        vm?.updateHandler = tableView.reloadData
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(back_Tapped))
        backStackView.addGestureRecognizer(tapGesture)
    }
    func fetchData(){
        vm?.getData()
    }
    @objc func back_Tapped(){
        coordinator.navigationController.popViewController(animated: true)
    }
   
}
extension ExtraController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.extraArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExtraParentTableViewCell.reuseIdentifier, for: indexPath) as! ExtraParentTableViewCell
        if let extra = vm?.extraArray[indexPath.row]{
            cell.vm = extra
        }
        cell.reloadDelegate = self
        cell.indexPath = indexPath
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let vm = vm else {
            return 0
        }
        if vm.extraArray[indexPath.row].isCollapsed{
            return CGFloat(collapsedSize + (76 * vm.extraArray[indexPath.row].selections.count) + extraBottomSpace )
        }else{
            return CGFloat(collapsedSize)
        }
    }
}

extension ExtraController : ReloadTableViewIndexPathDelegate{
    /// use this function to reload a specific index path of table view
    /// - Parameter indexPath: indexPath to reload
    func reloadAt(indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
