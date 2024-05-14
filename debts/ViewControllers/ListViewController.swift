//
//  ViewController.swift
//  debts
//
//  Created by Anna Ablogina on 13.05.2024.
//

import UIKit

final class ListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
    }

    @objc private func addDebt() {
        let addingVC = AddingViewController()
        present(addingVC, animated: true)
    }

}

private extension ListViewController {
    func setupNavigationBar () {
        title = "Список должников"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addDebt)
        )
    }
}
