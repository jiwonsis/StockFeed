import UIKit

class GroupsDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel : GroupsManager!
    
    init(viewModel: GroupsManager) {
        self.viewModel = viewModel
    }
    
    var didSelected : ((Group?)->Void)?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelected?(viewModel.groupsAt(index: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GroupCell.cellForHeight()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.groupsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseIdentifier, for: indexPath) as! GroupCell
        
        // Comment: 코드 커버리지 0 사유 : 해당 코드는 방어 용도의 코드이기 때문에 테스트가 불가능함.
        guard let group = viewModel.groupsAt(index: indexPath.row) else { return UITableViewCell() }
        
        cell.configureGroupCell(group: group)
        return cell
        
    }
}
