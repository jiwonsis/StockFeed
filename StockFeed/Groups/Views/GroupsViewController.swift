import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var groupTableView: UITableView!
    @IBOutlet var dataService: GroupsDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupTableView.delegate = dataService
        groupTableView.dataSource = dataService
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-add_folder"), style: .plain, target: self, action: #selector(openEditGroup))
        title = "그룹"
    }
    
//    @objc func openEditGroup() {
//
//    }

}
