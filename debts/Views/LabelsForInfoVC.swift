//
//  LabelsForInfoVC.swift
//  debts
//
//  Created by Anna Ablogina on 21.05.2024.
//

import UIKit

class LabelsForInfoVC {
    static func setupLabels(for view: UIView, name: UILabel, number: UILabel) {
        view.addSubview(name)
        view.addSubview(number)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        number.translatesAutoresizingMaskIntoConstraints = false
        
        name.text = "name"
        number.text = "number"
        
        let nameConstraints = [
            name.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let numberConstraints = [
            number.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            number.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(nameConstraints)
        NSLayoutConstraint.activate(numberConstraints)
        
    }
}
