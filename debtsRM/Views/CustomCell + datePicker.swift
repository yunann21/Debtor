//
//  CustomCell + datePicker.swift
//  debts
//
//  Created by Anna Ablogina on 14.05.2024.
//

import UIKit

class CustomTableViewCellDP: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(datePicker)
        
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        let dataPickerConstraints = [
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            datePicker.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.5),
            datePicker.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            datePicker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(dataPickerConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
