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
    let start: Int
    let homeTeam: Team
    let awayTeam: Team
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

extension Match: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        start = try  container.decode(Int.self, forKey: .start)
        competition = try container.decode(Competition.self, forKey: .competition)
        homeTeam = try container.decode(Team.self, forKey: .homeTeam)
        awayTeam = try container.decode(Team.self, forKey: .awayTeam)
    }
}

