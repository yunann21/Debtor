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
    
    static func labelText(for row: Int) -> String {
        switch row {
        case 0:
            "ФИО"
        case 1:
            "Номер"
        case 2:
            "Сумма"
        case 3:
            "Дата начала"
        case 4:
            "Дата окончания"
        case 5:
            "Комментарий"
        case 6:
            "Уведомление"
        default:
            "unknown"
        }
    }
    
     static func convert(rowValue: Int ) -> DebtCellType {
        values[rowValue]
    }
    
    
}

