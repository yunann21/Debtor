//
//  CustomCell + Button.swift
//  debts
//
//  Created by Anna Ablogina on 16.05.2024.
//

import UIKit

class CustomTableViewCellB: UITableViewCell {
    
    let buttonExitOrDelete: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    let buttonSave: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(buttonExitOrDelete)
        contentView.addSubview(buttonSave)
        
        let buttonExitConstraints = [
            buttonExitOrDelete.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonExitOrDelete.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            buttonExitOrDelete.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        
        let buttonSaveConstraints = [
            buttonSave.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonSave.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            buttonSave.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        
        NSLayoutConstraint.activate(buttonExitConstraints)
        NSLayoutConstraint.activate(buttonSaveConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
