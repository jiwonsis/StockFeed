import XCTest
@testable import StockFeed

class GroupsViewControllerTests: XCTestCase {
    
    var sut: GroupsViewController!
    
    override func setUp() {
        super.setUp()
        sut = GroupsViewController()
        _ = sut.view
    }
    
    // ViewDidLoad시, 테이블 뷰가 nil아이여야 한다.
    func test_GroupTableView_ShouldNotNil() {
        XCTAssertNotNil(sut.groupTableView)
    }
    
    // ViewDidLoad시, 테이블 데이터 소스는 nil이 아니며, GroupsDataService 클래스여야 한다
    func test_ViewDidLoad_ShouldBeTableViewDataSouceNotNil() {
        
        XCTAssertNotNil(sut.groupTableView.dataSource)
        XCTAssertTrue(sut.groupTableView.dataSource is GroupsDataService)
    }
    
    // ViewDidLoad시, 테이블 딜리게이트는 nil이 아니며, GroupsDataService 클래스여야 한다
    func test_ViewDidLoad_ShouldBeTableViewDelegateNotNil() {
        XCTAssertNotNil(sut.groupTableView.delegate)
        XCTAssertTrue(sut.groupTableView.delegate is GroupsDataService)
    }
    
    func test_ViewDidLoad_SetTableDelegateAndTableDataSourceToSameObject() {
        XCTAssertEqual(sut.groupTableView.dataSource as! GroupsDataService, sut.groupTableView.delegate as! GroupsDataService) 
    }
    
}
