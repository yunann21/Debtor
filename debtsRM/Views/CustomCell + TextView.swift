//
//  CustomCell + TextView.swift
//  debts
//
//  Created by Anna Ablogina on 14.05.2024.
//

import UIKit

class CustomTableViewCellTV: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = true
        textView.isScrollEnabled = false
        textView.layer.borderColor = UIColor(named: "border")?.cgColor
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1.0
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(textView)
        
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        let textViewConstraints = [
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            textView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            textView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            textView.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(textViewConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

