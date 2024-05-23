//
//  CustomCell + Switch.swift
//  debts
//
//  Created by Anna Ablogina on 14.05.2024.
//

import UIKit

class CustomTableViewCellS: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        switchControl.isOn = false // Устанавливаем значение по умолчанию
        return switchControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(switchControl)
        
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        let switchControlConstraints = [
            switchControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            switchControl.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            switchControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(switchControlConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
