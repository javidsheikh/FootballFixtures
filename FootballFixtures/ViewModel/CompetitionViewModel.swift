//
//  CompetitionViewModel.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import Foundation

class CompetitionViewModel {

    var competitionName: String
    var matches: [Match]
    var numberOfRows: Int {
        return matches.count
    }

    init(competitionName: String, matches: [Match]) {
        self.competitionName = competitionName
        self.matches = matches.sorted { $0.kickOff < $1.kickOff }
    }

    func getViewModelForCell(with indexPath: IndexPath) -> Match {
        return matches[indexPath.row]
    }
}
