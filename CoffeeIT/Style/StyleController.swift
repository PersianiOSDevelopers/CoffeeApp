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
    /// fetch data from the view model and show loading until data receive and show error if there is a problem
    func fetchData(){
        self.startLoading()
        vm?.getData(completion: { [weak self] err in
            self?.stopLoading()
            if let err = err{
                self?.showError(error: err)
            }
        })
    }
    func showError(error : Error){
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        showDetailViewController(alert, sender: self)
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
