//
//  CompetitionTableViewController.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import UIKit

class CompetitionTableViewController: UITableViewController {

    var viewModel: CompetitionViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.competitionName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchListCell", for: indexPath)
        let cellViewModel = viewModel.getViewModelForCell(with: indexPath)
        cell.textLabel?.text = "\(cellViewModel.homeTeam.name) v \(cellViewModel.awayTeam.name)"
        cell.detailTextLabel?.text = cellViewModel.kickOff.toPrettyString(withFormat: "dd-MM-yy HH:mm")
        return cell
    }

}
