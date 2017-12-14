import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var groupTableView: UITableView!
    var dataService: GroupsDataService!
    var dataManager: GroupsManager!
    
    init(dataService: GroupsDataService) {
        self.dataService = dataService
        self.dataManager = dataService.dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    // Comment: 코드 커버리지 0
    // 사유 : 해당 init은 필수적으로 해야하기 때문에 테스트에서 제어할 수 없다.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService.dataManager = dataManager
        dataService.didSelected = { group in
            self.openEditView(group: group)
        }
        
        groupTableView.delegate = dataService
        groupTableView.dataSource = dataService
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-add_folder"), style: .plain, target: self, action: #selector(openEditGroup))
        title = "그룹"
        groupTableView.register(UINib(nibName: GroupCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: GroupCell.reuseIdentifier)
        
    }
    
    // TODO : UITest시에 테스트 할 것!
    @objc func openEditGroup() {
        openEditView()
    }

    func openEditView(group: Group?=nil) {
        
    }
    
}
