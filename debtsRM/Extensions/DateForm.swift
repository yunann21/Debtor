//
//  DateForm.swift
//  debtsRM
//
//  Created by Anna Ablogina on 23.05.2024.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: self )
        return dateString
    }
}
