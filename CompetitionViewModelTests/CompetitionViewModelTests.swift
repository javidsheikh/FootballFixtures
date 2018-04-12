//
//  CompetitionViewModelTests.swift
//  CompetitionViewModelTests
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import XCTest
@testable import FootballFixtures

class CompetitionViewModelTests: XCTestCase {

    var sut: CompetitionViewModel!
    var matchesArray: [Match]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let competition = Competition(name: "EPL", ordering: 1, dbid: 1, matches: nil)
        let date1 = try! "27/01/2018 11:00".toDate(withFormat: "dd/MM/yyyy HH:mm")
        let date2 = try! "27/01/2018 11:00".toDate(withFormat: "dd/MM/yyyy HH:mm")
        let date3 = try! "27/01/2018 13:00".toDate(withFormat: "dd/MM/yyyy HH:mm")
        let date4 = try! "27/01/2018 14:00".toDate(withFormat: "dd/MM/yyyy HH:mm")
        let date5 = try! "27/01/2018 15:00".toDate(withFormat: "dd/MM/yyyy HH:mm")

        matchesArray = [Match(competition: competition, kickOff: date5, homeTeam: Team(name: "Man Utd"), awayTeam: Team(name: "Chelsea")),
                            Match(competition: competition, kickOff: date3, homeTeam: Team(name: "Man City"), awayTeam: Team(name: "West Brom")),
                            Match(competition: competition, kickOff: date1, homeTeam: Team(name: "Arsenal"), awayTeam: Team(name: "Spurs")),
                            Match(competition: competition, kickOff: date2, homeTeam: Team(name: "Liverpool"), awayTeam: Team(name: "Everton")),
                            Match(competition: competition, kickOff: date4, homeTeam: Team(name: "Crystal Palace"), awayTeam: Team(name: "Swansea"))
                            ]
        sut = CompetitionViewModel(competitionName: competition.name, matches: matchesArray)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func test_matchesSortedChronologically() {
        let datesArray = matchesArray.map { $0.kickOff }
        XCTAssert(sut.matches.first?.kickOff == datesArray.min(), "First match has earliest date")
        XCTAssert(sut.matches.last?.kickOff == datesArray.max(), "Last match has latest date")
    }
    
}
