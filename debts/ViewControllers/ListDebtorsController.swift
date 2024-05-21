//
//  ListDebtors.swift
//  debts
//
//  Created by Anna Ablogina on 16.05.2024.
//

import UIKit

final class ListDebtorsController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCellDebtorView.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self

        setupUI()
    }
    
    @objc func addButtonTapped() {
            print("Add button tapped")
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cellV = cell as? CustomCellDebtorView else {return cell}
        
        return cellV
    }
    
    private func setupUI() {
        title = "Список должников"
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    

    
}





