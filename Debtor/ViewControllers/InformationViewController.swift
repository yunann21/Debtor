//
//  InformationViewController.swift
//  Debtor
//
//  Created by Anna Ablogina on 18.03.2024.
//

import UIKit

final class InformationViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    var debt: DebtInfo!
    private let parameters = Parameters.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = debt.name
        //numberLabel.text = debt.debtor.number.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    
    
    @IBAction func deleteButton() {
        //+ alert
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showStatistics() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addingVC = segue.destination as? AddingTableViewController
        addingVC?.debt = debt
    }
}

//extension InformationViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        parameters.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
//        guard let debtCell = cell as? AboutDebtCell else {return cell}
//        let parametr = parameters[indexPath.row]
//        debtCell.parameterLabel.text = parametr.rawValue
//        debtCell.valueLabel.text = switch parametr {
//        case .amount:
//            debt.amountOfDebt.description
//        case .startDate:
//            debt.startDate.toString()
//        case .finishDate:
//            debt.finishDate.toString()
//        case .comment:
//            debt.comment
//        }
//        return debtCell
//    }
    

    
//}


