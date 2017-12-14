import XCTest
@testable import StockFeed

class GroupsViewControllerTests: XCTestCase {
    
    var sut: GroupsViewController!
    
    override func setUp() {
        super.setUp()
        let viewModel = GroupsManager()
        let dataServie = GroupsDataService(viewModel: viewModel)
        sut = GroupsViewController(dataService: dataServie, viewModel: viewModel)
    }
    
    // ViewDidLoad시, 테이블 뷰가 nil아이여야 한다.
    func test_GroupTableView_ShouldNotNil() {
        _ = sut.view
        XCTAssertNotNil(sut.groupTableView)
    }
    
    // ViewDidLoad시, 테이블 데이터 소스는 nil이 아니며, GroupsDataService 클래스여야 한다
    func test_ViewDidLoad_ShouldBeTableViewDataSouceNotNil() {
        _ = sut.view
        XCTAssertNotNil(sut.groupTableView.dataSource)
        XCTAssertTrue(sut.groupTableView.dataSource is GroupsDataService)
    }
    
    // ViewDidLoad시, 테이블 딜리게이트는 nil이 아니며, GroupsDataService 클래스여야 한다
    func test_ViewDidLoad_ShouldBeTableViewDelegateNotNil() {
        _ = sut.view
        XCTAssertNotNil(sut.groupTableView.delegate)
        XCTAssertTrue(sut.groupTableView.delegate is GroupsDataService)
    }
    
    // ViewDidLoad시, 테이블 딜리게이트와 데이터 소스는 GroupDataService 클래스여야 한다
    func test_ViewDidLoad_SetTableDelegateAndTableDataSourceToSameObject() {
        _ = sut.view
        XCTAssertEqual(sut.groupTableView.dataSource as! GroupsDataService, sut.groupTableView.delegate as! GroupsDataService) 
    }
    
    
    // 테이블뷰에서 선택한 셀은 OpenEditView 메소드를 호출해야한다.
    func test_CallOpenEditView_ShouldReturnTrue() {
        let viewModel = GroupsManager()
        let dataServie = GroupsDataService(viewModel: viewModel)
        let groupsViewControllerMock = GroupsViewControllerMock(dataService: dataServie, viewModel: viewModel)
        let tableView = UITableView()
        groupsViewControllerMock.groupTableView = tableView
        groupsViewControllerMock.viewModel.addGroup(group: Group(title: "더미타이틀", note: "더미 노트"))
        _ = groupsViewControllerMock.view
        
        tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(groupsViewControllerMock.isOpen)
    }
    
}
