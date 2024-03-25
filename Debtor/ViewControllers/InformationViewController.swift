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
    
    var personInformation: Debt!
    private let parameters = Parameters.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = personInformation.debtor.fullName
        numberLabel.text = personInformation.debtor.number.description
        
    }
    
    @IBAction func deleteButton() {
        //+ alert
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showStatistics() {
    }
    
}

extension InformationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        parameters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
        guard let debtCell = cell as? AboutDebtCell else {return cell}
        let parametr = parameters[indexPath.row]
        debtCell.parameterLabel.text = parametr.rawValue
        debtCell.valueLabel.text = switch parametr {
        case .amount:
            personInformation.amountOfDebt.description
        case .startDate:
            personInformation.startDate.toString()
        case .finishDate:
            personInformation.finishDate.toString()
        case .comment:
            personInformation.comment
        }
        return debtCell
    }
    

    
}

