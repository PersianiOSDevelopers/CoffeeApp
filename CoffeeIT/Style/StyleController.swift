import UIKit

class StyleController: UIViewController  , Storyboarded{
    weak var coordinator : MainCoordinator?
    var vm : StyleViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = .none
        registerItemTableViewCell(tableView : tableView)
        vm?.updateHandler = tableView.reloadData
    }
    func fetchData(){
        self.startLoading()
        vm?.getData(completion: {
            self.stopLoading()
        })
    }
}
extension StyleController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.items.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifierAndNibName, for: indexPath) as! ItemTableViewCell
        cell.vm = vm?.items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedStyle = vm?.styles[indexPath.row]{
            coordinator?.selectedStyle = selectedStyle
        }
        coordinator?.goToScan()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
