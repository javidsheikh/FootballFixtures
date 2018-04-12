//
//  CompetitionListTableViewController.swift
//  FootballFixtures
//
//  Created by Javid Sheikh on 12/04/2018.
//  Copyright © 2018 Javid Sheikh. All rights reserved.
//

import UIKit

class CompetitionListTableViewController: UITableViewController {

    var viewModel: CompetitionListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Competitions"
        
        viewModel = CompetitionListViewModel()
        bindViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func bindViewModel() {
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.diplayErrorAlertWithMessage = { [weak self] message in
            DispatchQueue.main.async {
                self?.displayErrorAlert(withMessage: message)
            }
        }
        viewModel.initDataFetch()
    }

    fileprivate func displayErrorAlert(withMessage message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompListCell", for: indexPath)
        let cellViewModel = viewModel.getViewModelForCell(with: indexPath)
        cell.textLabel?.text = cellViewModel.competitionName

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompetitionTableViewController") as! CompetitionTableViewController
        controller.viewModel = viewModel.getViewModelForCell(with: indexPath)
        navigationController?.pushViewController(controller, animated: true)
    }


}
