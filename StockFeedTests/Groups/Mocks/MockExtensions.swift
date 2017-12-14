import UIKit
@testable import StockFeed

extension  GroupsDataServiceTests {
    class TableViewMock: UITableView {
        
        var cellDequeusedPropertly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            
            cellDequeusedPropertly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        class func initializeMock() -> TableViewMock {
            let tableViewMock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 400, height: 800), style: .plain)
            tableViewMock.register(GroupCellMock.self, forCellReuseIdentifier: GroupCell.reuseIdentifier)
            
            return tableViewMock
        }
    }
    
    
    class GroupCellMock: GroupCell {
        
        var group : Group?
        
        override func configureGroupCell(group: Group) {
            self.group = group
        }
    }
}

extension GroupsViewControllerTests {
    class GroupsViewControllerMock: GroupsViewController {
        var isOpen = false
        
        override func openEditView(group: Group?) {
            isOpen = true
            super.openEditView(group: group)
        }
    }
}
