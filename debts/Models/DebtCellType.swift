//
//  DebtCellTipe.swift
//  debts
//
//  Created by Anna Ablogina on 16.05.2024.
//

import Foundation

enum DebtCellType: Int {
    case textFieldCell
    case dataPickerCell
    case textViewCell
    case switchCell
    case buttonCell
    
    static var  values: [DebtCellType]  {
        
        [
            .textFieldCell,
            .textFieldCell,
            .textFieldCell,
            .dataPickerCell,
            .dataPickerCell,
            .textViewCell,
            .switchCell,
            .buttonCell
        ]
    }
    
     static func convert(rowValue: Int ) -> DebtCellType {
        values[rowValue]
    }
}

