//
//  ListDebtors.swift
//  debts
//
//  Created by Anna Ablogina on 16.05.2024.
//

import UIKit

final class ListDebtorsViewController: UITableViewController {
    
    let debts = DebtRM.generateDebts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomCellDebtorView.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        

        setupUI()
        
    }
    
    @objc func addButtonTapped() {
        let addingVC = AddingViewController()
                navigationController?.pushViewController(addingVC, animated: true)
        }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cellV = cell as? CustomCellDebtorView else {return cell}
        
        let modelDebt = debts[indexPath.row]
        
        let content = cellV
        content.nameLabel.text = modelDebt.name
        content.amountLabel.text = modelDebt.amountOfDebt.description
        content.startDateLabel.text = modelDebt.startDate.toString()
        content.finalDateLabel.text = modelDebt.finishDate.toString()
        
        return cellV
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let addingVC = AddingViewController()
        addingVC.debt = debts[indexPath.row]
        
        navigationController?.pushViewController(addingVC, animated: true)
    }
    
    private func setupUI() {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
        navigationItem.backButtonTitle = "Назад"
        navigationItem.title = "Список должников"
    }
    

    
}





