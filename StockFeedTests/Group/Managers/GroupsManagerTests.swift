import XCTest
@testable import StockFeed

class GroupsManagerTests: XCTestCase {
    
    var sut : GroupsManager!
    
    override func setUp() {
        super.setUp()
        sut = GroupsManager()
    }
    
    // 초기화 시 그룹 카운트는 0이어야한다
    func test_GroupCount_ShouldReturnsZero() {
        XCTAssertEqual(sut.groupsCount, 0)
    }
    
    // 그룹 추가시 그룹 카운트는 1이어야 한다.
    func test_AddGroup_ShuldBeCountOne() {
        sut.addGroup(group: Group(title: "더미 그룹"))
        XCTAssertEqual(sut.groupsCount, 1)
    }
    
    // 그룹 추가하고 삭제 시 그룹 카운트는 0이어야한다.
    func test_removeGroupAtIndex_ShouldBeCountZero() {
        sut.addGroup(group: Group(title: "더미 그룹"))
        sut.removeGroupAt(index: 0)
        XCTAssertEqual(sut.groupsCount, 0)
    }
    
    // 그룹을 추가하고 삭제 시 잘못된 인덱스를 넣을 경우 삭제가 되지 않아야 한다.
    func test_removeGroupAtIndexOverCount_ShouldBeCountOne() {
        sut.addGroup(group: Group(title: "더미 그룹"))
        sut.removeGroupAt(index: 100)
        XCTAssertNotEqual(sut.groupsCount, 0)
        XCTAssertNotEqual(sut.groupsCount, 99)
        
        sut.removeGroupAt(index: -99)
        XCTAssertEqual(sut.groupsCount, 1)
    }
    
    // 그룹을 추가하고 해당 타이틀과 동일한 타이틀로 찾을 경우 결과값이 True가 나와야 한다.
    func test_GroupsSearchSameTitle_ShouldReturnTrue() {
        let group1 = Group(title: "검색 그룹")
        let group2 = Group(title: "검색하지 않는 그룹")
        
        sut.addGroup(group: group1)
        sut.addGroup(group: group2)
        
        let isSameTitle = sut.search(title: "검색 그룹")
        XCTAssertTrue(isSameTitle)
    }
    
    // 그룹을 추가하고 해당 타이틀과 다른 타이틀로 찾을 경우 결과값이 True가 나와야 한다.
    func test_GroupsSearchDiffrentTitle_ShouldReturnFalse() {
        let group1 = Group(title: "검색 그룹")
        let group2 = Group(title: "검색하지 않는 그룹")
        
        sut.addGroup(group: group1)
        sut.addGroup(group: group2)
        
        let isSameTitle = sut.search(title: "검색되지 않는 그룹")
        XCTAssertFalse(isSameTitle)
    }
    
    // 그룹을 전부다 삭제 시, 그룹 카운트는 0이 된다
    func test_ClearAllGroups_ShouldGroupCountZero() {
        sut.addGroup(group: Group(title: "더미 그룹1"))
        sut.addGroup(group: Group(title: "더미 그룹2"))
        
        XCTAssertEqual(sut.groupsCount, 2)
        
        sut.clearAllGroup()
        XCTAssertEqual(sut.groupsCount, 0)
    }
    
    func test_UpdateGroup_ShouldNotSameGroup() {
        let group1 = Group(title: "일번 그룹", note: "일번 노트")
        let group2 = Group(title: "이번 그룹", note: "이번 노트")
        
        sut.addGroup(group: group1)
        sut.updataAt(group: group2, index: 0)
        
        XCTAssertNotEqual(sut.groupsAt(index: 0), group1)
        XCTAssertEqual(sut.groupsAt(index: 0), group2)
    }
    
}

extension GroupsManagerTests {
    
    // 그룹에 데이터 유무에 상관없이 인코딩이 데이터로 변환이 되어야 한다.
    func test_EncodeGroups_ShouldBeNotNil() {

        let encodeData1 = sut.encodeGroups()
        XCTAssertNotNil(encodeData1)
        
        sut.addGroup(group: Group(title: "더미 그룹"))
        let encodeData2 = sut.encodeGroups()
        XCTAssertNotNil(encodeData2)
    }
    
    // 그룹들 배열에 아무것이 디코딩 했을 경우, 그룹 배열은 0이 되어야 한다.
    func test_DecodeGroups_ShouldGroupsCountToZero() {
        let encodeData = sut.encodeGroups()
        sut.decodeGroups(encodeData: encodeData)
        
        XCTAssertEqual(sut.groupsCount, 0)
    }
    
    // 그룹배열에 그룹을 추가하고 디코딩 했을 경우, 그룹 배열은 1이 되어야 한다
    func test_DecodeGroups_ShouldBeNotNilAndCountOne() {
        sut.addGroup(group: Group(title: "더미 그룹"))
        let encodeData = sut.encodeGroups()
        sut.decodeGroups(encodeData: encodeData)
        
        XCTAssertEqual(sut.groupsCount, 1)
    }
    
    // 그룹배열에 타이틀과 노트가 각각 다른 3개의 그룹을 추가 시키고, 디코딩 할 경우 각 그룹이 동일해야 한다.
    func test_DecodeAndEncodeGroups_ShouldSameGroup() {
        let group1 = Group(title: "테스트 그룹1", note: "테스트 노트1")
        let group2 = Group(title: "테스트 그룹2", note: "테스트 노트2")
        let group3 = Group(title: "테스트 그룹3", note: "테스트 노트3")
        
        sut.addGroup(group: group1)
        sut.addGroup(group: group2)
        sut.addGroup(group: group3)
        let encodeData = sut.encodeGroups()
        sut.decodeGroups(encodeData: encodeData)
        
        XCTAssertEqual(sut.groupsAt(index: 0), group1)
        XCTAssertEqual(sut.groupsAt(index: 1), group2)
        XCTAssertEqual(sut.groupsAt(index: 2), group3)
    }
    
    

    
}
