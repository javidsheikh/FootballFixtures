//
//  Match.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import Foundation

struct Match {
    enum CodingKeys: String, CodingKey {
        case competition, start, homeTeam, awayTeam
    }
    let competition: Competition
    let kickOff: Date
    let homeTeam: Team
    let awayTeam: Team
}

extension Match: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let start = try  container.decode(Int.self, forKey: .start)
        kickOff = Match.getDate(from: start)
        competition = try container.decode(Competition.self, forKey: .competition)
        homeTeam = try container.decode(Team.self, forKey: .homeTeam)
        awayTeam = try container.decode(Team.self, forKey: .awayTeam)
    }

    fileprivate static func getDate(from start: Int) -> Date {
        return Date(timeIntervalSince1970: Double(start/1000))
    }
}

struct Competition: Decodable {
    let name: String
    let ordering: Int
    let dbid: Int
    var matches: [Match]?
}

struct Team: Decodable {
    let name: String
}

