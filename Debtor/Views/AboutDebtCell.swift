//
//  AboutDebtCell.swift
//  Debtor
//
//  Created by Anna Ablogina on 20.03.2024.
//

import UIKit

final class AboutDebtCell: UITableViewCell {
    
    @IBOutlet weak var parameterLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func setup(parameter: String) {
        parameterLabel.text = parameter
    }

    
}

