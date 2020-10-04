//
//  ViewController.swift
//  DemoMVVM
//
//  Created by Git on 04/10/20.
//  Copyright © 2020 Github. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    var service = UserService()
    var viewModels = [UserViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetUp()
        fetchUsers()
    }
    
    private func initialUISetUp() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func fetchUsers() {
        service.fetchUsers { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                do {
                    self.viewModels = try result.get()
                    self.tableView.reloadData()
                } catch {
                    print(error.localizedDescription)
                    // Show error view
                }
            }
        }
    }

    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell") as? UserListTableViewCell else {
            fatalError("Fail to deque")
        }
        cell.setUp(viewModel: viewModels[indexPath.row])
        cell.delegate = self 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(identifier: String(describing: DetailViewController.self)) as? DetailViewController else { return }
        detailVC.viewModel = viewModels[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension ListViewController: TapDelegate {
    func starButtonTapped(_ sender: UITableViewCell) {
        guard let index = tableView.indexPath(for: sender)?.row else { return }
        viewModels[index].isFavourite.value = !viewModels[index].isFavourite.value
    }
}
