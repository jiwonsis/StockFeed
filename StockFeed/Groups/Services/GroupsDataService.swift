import UIKit

class GroupsDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var dataManager : GroupsManager!
    
    init(dataManager: GroupsManager) {
        self.dataManager = dataManager
    }
    
    var didSelected : ((Group?)->Void)?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let manager = dataManager else { return }
        
        didSelected?(manager.groupsAt(index: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GroupCell.cellForHeight()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let manager = dataManager else { return 0 }
        return manager.groupsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseIdentifier, for: indexPath) as! GroupCell
        
        // Comment: 코드 커버리지 0 사유 : 해당 코드는 방어 용도의 코드이기 때문에 테스트가 불가능함.
        guard let manager = dataManager else { return UITableViewCell() }
        guard let group = manager.groupsAt(index: indexPath.row) else { return UITableViewCell() }
        
        cell.configureGroupCell(group: group)
        return cell
        
    }
}
