//
//  CompetitionListViewModelTests.swift
//  CompetitionListViewModelTests
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import XCTest
@testable import FootballFixtures

class CompetitionListViewModelTests: XCTestCase {

    var sut: CompetitionListViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CompetitionListViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func test_initCompetitionViewModelArray() {
        sut.initDataFetch()
        sut.initCompetitionViewModelArray(with: &sut.rawData!)
        XCTAssertNotNil(sut.competitions)
    }
    
    func test_sortCompetitionByOrder() {
        sut.initDataFetch()
        sut.initCompetitionViewModelArray(with: &sut.rawData!)
        sut.sortCompetitionsByOrder(sut.competitions!)
        let orderingArray = sut.competitions?.map { $0.ordering }
        XCTAssert(sut.competitions?.first?.ordering == orderingArray?.min(), "First competition has lowest ordering value")
        XCTAssert(sut.competitions?.last?.ordering == orderingArray?.max(), "Last competition has highest ordering value")
    }

    func test_initCellViewModels() {
        sut.initDataFetch()
        sut.initCompetitionViewModelArray(with: &sut.rawData!)
        sut.initCellViewModels(with: sut.competitions!)
        XCTAssertNotNil(sut.cellViewModels)
    }
    

    
}
