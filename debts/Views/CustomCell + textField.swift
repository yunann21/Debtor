//
//  CastomCell.swift
//  debts
//
//  Created by Anna Ablogina on 14.05.2024.
//

import UIKit

class CustomTableViewCellTF: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        addSubview(textField)
        
        let labelConstraints = [
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        let textFieldConstraints = [
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        textField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(textFieldConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
