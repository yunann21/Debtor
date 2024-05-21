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
            informationVC.delegate = self
            let index = tableView.indexPathForSelectedRow?.row ?? 0
            informationVC.debt = debtors[index]
        } else if let addingTVC = segue.destination as? AddingTableViewController {
            addingTVC.delegate = self
    
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
        debtors = StorageManager.shared.fetchData()
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
        content.secondaryText = infoDebt.amount.description
        
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
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let debt = debtors[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] _,_,_ in
            StorageManager.shared.deleteDebt(debt: debt)
            debtors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
//        
//        let editAction = UIContextualAction(style: .normal, title: "Edit") { [unowned self] _, _, isDone in
//            showAlert(with: debtors) {
//                tableView.reloadRows(at: [indexPath], with: .automatic)
//            }
//            isDone(true)
//        }
//        
//        let doneAction = UIContextualAction(style: .normal, title: "Done") { [unowned self] _, _, isDone in
//            storageManager.done(debtors)
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//            isDone(true)
//        }
        
//        editAction.backgroundColor = .orange
//        doneAction.backgroundColor =  colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: //[doneAction, editAction,
                                                    [ deleteAction])
    }
}

extension MainViewController: AddingTableViewControllerDelegate {

    
    func reloadData() {
//        DispatchQueue.main.async {
            fetchData()
            tableView.reloadData()
//        }
    }
    
    
    
}
