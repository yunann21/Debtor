//
//  CustomCellDebtor.swift
//  debts
//
//  Created by Anna Ablogina on 16.05.2024.
//

import UIKit

class CustomCellDebtorView: UITableViewCell {
    
    let nameLabel = UILabel()
    let amountLabel = UILabel()
    let startDateLabel = UILabel()
    let finalDateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabels()
    }
    
    private func setupLabels() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(startDateLabel)
        contentView.addSubview(finalDateLabel)
        
        nameLabel.text = "nameLabel"
        amountLabel.text = "amountLabel"
        startDateLabel.text = "startDateLabel"
        finalDateLabel.text = "finalDateLabel"
        
        [nameLabel, amountLabel, startDateLabel, finalDateLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
       
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let amountLabelConstraints = [
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            amountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            amountLabel.heightAnchor.constraint(equalToConstant: 30),
            amountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ]
        
        let startDateLabelConstraints = [
            startDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            startDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            startDateLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let finalDateLabelConstraint = [
            finalDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            finalDateLabel.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 10),
            finalDateLabel.heightAnchor.constraint(equalToConstant: 30),
            finalDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ]
        
        
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(amountLabelConstraints)
        NSLayoutConstraint.activate(startDateLabelConstraints)
        NSLayoutConstraint.activate(finalDateLabelConstraint)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
