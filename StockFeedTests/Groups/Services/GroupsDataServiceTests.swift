import XCTest
@testable import StockFeed

class GroupsDataServiceTests: XCTestCase {
    
    var sut : GroupsDataService!
    var tableView: UITableView!
    var groupsVC: GroupsViewController!
    var dataManager: GroupsManager!
    
    
    override func setUp() {
        super.setUp()
        
        sut = GroupsDataService(viewModel: GroupsManager())
        tableView = UITableView()
        
        groupsVC = GroupsViewController(dataService: sut, viewModel: GroupsManager())
        groupsVC.groupTableView = tableView
        _ = groupsVC.view
        
        tableView = groupsVC.groupTableView
        tableView.dataSource = sut
        tableView.delegate = sut
    }
    
    // 테이블뷰는 섹션은 무조건 하나다
    func test_TableViewSectionCount_ShouldBeOne() {
        let sectionCount = tableView.numberOfSections
        
        XCTAssertEqual(sectionCount, 1)
    }
    
    // 데이터 메니저에 데이터를 추가하면 테이블 뷰 함수에서 데이터 열과 동일하다
    func test_RowCountInSection_ShouldEqualGroupCount() {
        sut.viewModel.addGroup(group: Group(title: "더미 타이틀 1호"))
        sut.viewModel.addGroup(group: Group(title: "더미 타이틀 2호"))
        
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), sut.viewModel.groupsCount)
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    // 테이블뷰에서 생성되는 셀은 GroupCell이어야 한다
    func test_CellForRowAtIndex_ShouldReturnGroupCell() {
        sut.viewModel.addGroup(group: Group(title: "더미 타이틀 그룹", note: nil))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is GroupCell)
    }
    
    // 테이블뷰에서 반드시 셀을 재활용 하는 Dequeue설정으로 생성되어야 한다.
    func test_Cell_ShouldBeDequeuseCell() {
        let tableViewMock = TableViewMock.initializeMock()
        tableViewMock.dataSource = sut
        
        sut.viewModel.addGroup(group: Group(title: "테스트 타이틀"))
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeusedPropertly)
    }
    
    // 생성되는 셀의 주입된 그룹과 주입했던 그룹은 동일한 값을 가지고 있어야 한다.
    func test_CellConfig_ShouldSameGroupObject() {
        let tableViewMock = TableViewMock.initializeMock()
        tableViewMock.dataSource = sut
        
        let group = Group(title: "더미 타이틀", note: "더미 노트")
        sut.viewModel.addGroup(group: group)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! GroupCellMock
        
        XCTAssertEqual(cell.group, group)
    }
    
    // 선택한 셀이 데이터는 선택시 호출되는 비동기 함수를 통해 접근한 데이터와 동일해야 한다.
    func test_SelectCellAndDidSelected_ShouldSameGroupObjec() {
        let group = Group(title: "더미 테스트", note: "테스트")
        sut.viewModel.addGroup(group: group)
        
        sut.didSelected = { selectGroup in
            XCTAssertEqual(selectGroup, group)
        }
        
        tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    }

    
}
