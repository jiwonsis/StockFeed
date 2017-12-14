import XCTest
@testable import StockFeed

class AppDelegateTests: XCTestCase {
    var sut: AppDelegate!
    var groupsViewController: GroupsViewController!
    
    override func setUp() {
        super.setUp()
        sut = AppDelegate()
    }
    
}
