//
//  DataFetchService.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import Foundation


class DataFetchService {

    static func fetchMatchesData() {
        if let path = Bundle.main.path(forResource: "matches", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let rawData = try JSONDecoder().decode([Match].self, from: data)
                print(rawData)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
