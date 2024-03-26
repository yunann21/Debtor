//
//  ViewController.swift
//  Debtor
//
//  Created by Anna Ablogina on 14.03.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    private var debts: [Debt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        directionLabel.textColor = .green
        debts = Debt.generateDebts()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.layer.zPosition = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let informationVC = segue.destination as? InformationViewController
        let index = tableView.indexPathForSelectedRow?.row ?? 0
        informationVC?.debt = debts[index]
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
}
    





extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return debts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = debts[indexPath.row].debtor.fullName
        cell.contentConfiguration = config
        return cell
    }
    

    
    
}
