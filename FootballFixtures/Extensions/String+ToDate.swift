//
//  String+ToDate.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import Foundation

extension String {
    func toDate(withFormat format: String) throws -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        guard let date = formatter.date(from: self) else {
            throw CustomError.error("Unable to convert String to Date")
        }
        return date
    }
}
