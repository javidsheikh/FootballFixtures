//
//  CompetitionListViewModel.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import Foundation


class CompetitionListViewModel {

//    lazy var matchesListViewModel: [Competition] = []

    init() {
        guard var rawModel = DataFetchService.fetchMatchesData() else {
            // TODO handle fetch data error
            return
        }
        initCompetitionModel(with: &rawModel)
    }

    fileprivate func initCompetitionModel(with rawModel: inout [Match]) {
        var competitions: [Competition] = []
        while !rawModel.isEmpty {
            print("Raw Model count: ", rawModel.count)
            let match = rawModel.first!
            var matchesArray = [match]
            let _ = rawModel.dropFirst()
            for element in rawModel {
                if element.competition.dbid == match.competition.dbid {
                    matchesArray.append(element)
                }
            }
            let competition = Competition(name: match.competition.name, ordering: match.competition.ordering, dbid: match.competition.dbid, matches: matchesArray)
            competitions.append(competition)
            rawModel = rawModel.filter { $0.competition.dbid != match.competition.dbid }
        }
        sortCompetitionModelByOrder(competitions)
    }

    fileprivate func sortCompetitionModelByOrder(_ competitions: [Competition]) {
        let sorted = competitions.sorted { $0.ordering < $1.ordering }
        initMatchesListViewModels(with: sorted)
    }

    fileprivate func initMatchesListViewModels(with competitions: [Competition]) {

    }


}
