//
//  ViewController.swift
//  Debtor
//
//  Created by Anna Ablogina on 14.03.2024.
//

import UIKit

protocol AddingTableViewControllerDelegate: AnyObject {
    func reloadData()
}

final class MainViewController: UIViewController {
    
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    private var debts: [Debt] = []
    private var debtors: [DebtInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        directionLabel.textColor = .green
        debts = Debt.generateDebts()
        fetchData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.layer.zPosition = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let informationVC = segue.destination as? InformationViewController {
            let index = tableView.indexPathForSelectedRow?.row ?? 0
            informationVC.debt = debtors[index]
        } else if let addingVC = segue.destination as? AddingTableViewController {
            addingVC.delegate = self
        }
        
        
    }
    
    
    @IBAction func chooseDirection(_ sender: UISwitch) {
        if sender.isOn {
            directionLabel.text = "Мне должны"
            directionLabel.textColor = .green
        } else {
            directionLabel.text = "Я должен"
            directionLabel.textColor = .red
        }
    }
    
    private func fetchData() {
        let fetchRequest = DebtInfo.fetchRequest()
        do {
            debtors = try StorageManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
}
    
// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debtors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        let infoDebt = debtors[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = infoDebt.name
        
        //var config = cell.defaultContentConfiguration()
        //config.text = debts[indexPath.row].debtor.fullName
        //cell.contentConfiguration = config
        
        cell.contentConfiguration = content
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
} 

extension MainViewController: AddingTableViewControllerDelegate {
    func reloadData() {
        fetchData()
        tableView.reloadData()
    }
}
