//
//  GroupStructTests.swift
//  StockFeedTests
//
//  Created by Scott moon on 13/12/2017.
//  Copyright © 2017 Scott moon. All rights reserved.
//

import XCTest
@testable import StockFeed

class GroupStructTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    // 그룹 구조체 초기화시 타이틀을 넣으면 동일한 타이틀의 값이 나와야 한다.
    func test_InitWithTitle_ShouldBeSameTitle() {
        let group = Group(title: "테스트 그룹")
        XCTAssertEqual(group.title, "테스트 그룹")
    }
    
    // 그룹 구조체가 초기화 할때 타이틀과 노트 주입 시 동일한 타이틀과 노트 값이 나와야 한다
    func test_InitWithTitleAndNote_ShoulBeSameTitleAndNote() {
        let group = Group(title: "테스트 그룹", note: "테스트 노트")
        XCTAssertEqual(group.title, "테스트 그룹")
        XCTAssertEqual(group.note, "테스트 노트")
    }
    
    // 두개의 그룹에 동일한 타이틀을 넣어 초기화 시 이 둘은 동일한 값을 가지고 있어야 한다.
    func test_InitWithSameTitle_ShouldEqualValue() {
        let group1 = Group(title: "테스트 그룹")
        let group2 = Group(title: "테스트 그룹")
        
        XCTAssertEqual(group1, group2)
    }
    
    // 두개의 그룹에 다른 타이틀를 넣어 초기화 시 이 둘은 동일하지 않는 값을 가지고 있어야 한다.
    func test_InitWithDiffrentTitle_ShouldNotEqualValue() {
        let group1 = Group(title: "테스트 그룹")
        let group2 = Group(title: "다른 테스트 그룹")
        
        XCTAssertNotEqual(group1, group2)
    }
    
    // 두개의 그룹에 동일한 타이틀과 서로 다른 노트값을 넣어 초기화 시 이 둘은 동일하지 않는 값을 가지고 있어야 한다.
    func test_InitWithSameTitleAndDiffrentNote_ShouldNotEqualValue() {
        let group1 = Group(title: "테스트 그룹", note: "테스트 노트")
        let group2 = Group(title: "테스트 그룹", note: "다른 테스트 노트")
        
        XCTAssertNotEqual(group1, group2)
    }
    
    // 두개의 그룹에 서로다른 타이틀과 노트값을 넣어 초기화 시 이 둘은 동일하지 않는 값을 가지고 있어야 한다.
    func test_InitWithNotDiffrentTitleAndNote_ShouldNotEqualValue() {
        
        let group1 = Group(title: "테스트 그룹", note: "테스트 노트")
        let group2 = Group(title: "다른 테스트 그룹", note: "다른 테스트 노트")
        
        XCTAssertNotEqual(group1, group2)
    }
    
}
