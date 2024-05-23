//
//  Debt.swift
//  debts
//
//  Created by Anna Ablogina on 23.05.2024.
//

import Foundation

struct DebtRM {
    var name: String
    var number: Int
    var amountOfDebt: Int
    var startDate: Date
    var finishDate: Date
    var comment: String = ""
    var notification: Bool

    
    static func generateDebts() -> [DebtRM] {
        [
            DebtRM(
                name: "Alex",
                number: 234567,
                amountOfDebt: 1000,
                startDate: Date(),
                finishDate: Date(),
                notification: true
            ),
            DebtRM(
                name: "Tim",
                number: 98765,
                amountOfDebt: 3000,
                startDate: Date(),
                finishDate: Date(),
                comment: "Проверка........................plo0i9uhygtf6g78koplkoiuygtfrdtyuhijokpoijhugytfrdtyuiokplkmjihugytfcryuiopkl[;kojihugytf6yuiokplpkojiuhygtr6yuiopiuyt78uh9io0jkiuytf7yg8uh9ijokoiuy7t6y8uh9ijo0k",
                notification: false
            )
        ]
    }
    
    func getValue<T>(for indexPath: IndexPath, type: T.Type) -> T?  {
        switch indexPath.row {
        case 0:
            name as? T
        case 1:
            number.description as? T
        case 2:
            amountOfDebt.description as? T
        case 3:
            startDate as? T
        case 4:
            finishDate as? T
        case 5:
            comment as? T
        case 6:
            notification as? T
        default:
            ""  as? T
        }
    }
}
