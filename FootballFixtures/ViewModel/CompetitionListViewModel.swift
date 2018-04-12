//
//  CompetitionListViewModel.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import Foundation


class CompetitionListViewModel {

    var rawData: [Match]?
    var competitions: [Competition]?
    var cellViewModels: [CompetitionViewModel] = []
    var numberOfRows: Int {
        return cellViewModels.count
    }
    var reloadTableView: (() -> Void)?
    var diplayErrorAlertWithMessage: ((String) -> Void)?

    func initDataFetch() {
        guard var rawModel = DataFetchService.fetchMatchesData(fromJSONFile: "matches") else {
            diplayErrorAlertWithMessage?("Unable to fetch competition list")
            return
        }
        rawData = rawModel
        initCompetitionViewModelArray(with: &rawModel)
    }

    func getViewModelForCell(with indexPath: IndexPath) -> CompetitionViewModel {
        return cellViewModels[indexPath.row]
    }

    func initCompetitionViewModelArray(with rawModel: inout [Match]) {
        var competitions: [Competition] = []
        while !rawModel.isEmpty {
            let match = rawModel.first!
            var matchesArray: [Match] = []
            for element in rawModel {
                if element.competition.dbid == match.competition.dbid {
                    matchesArray.append(element)
                }
            }
            let competition = Competition(name: match.competition.name, ordering: match.competition.ordering, dbid: match.competition.dbid, matches: matchesArray)
            competitions.append(competition)
            rawModel = rawModel.filter { $0.competition.dbid != match.competition.dbid }
        }
        self.competitions = competitions
        sortCompetitionsByOrder(competitions)
    }

    func sortCompetitionsByOrder(_ competitions: [Competition]) {
        let sorted = competitions.sorted { $0.ordering < $1.ordering }
        self.competitions = sorted
        initCellViewModels(with: sorted)
    }

    func initCellViewModels(with competitions: [Competition]) {
        cellViewModels = competitions.map {
            CompetitionViewModel(competitionName: $0.name, matches: $0.matches!)
        }
    }


}
