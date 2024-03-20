//
//  Debtor.swift
//  Debtor
//
//  Created by Anna Ablogina on 18.03.2024.
//

import Foundation

struct Debtor {
   var fullName: String
   var number: Int
}

struct Debt {
    var amountOfDebt: Double
    var startDate: Date
    var finishDate: Date
    var comment: String = ""
    var notification: Bool
    var debtor: Debtor
    
    static func generateDebts() -> [Debt] {
        [
            Debt(
                amountOfDebt: 1000,
                startDate: Date(),
                finishDate: Date(),
                notification: true,
                debtor: Debtor(fullName: "Саша", number: 1234567)
            ),
            Debt(
                amountOfDebt: 3000,
                startDate: Date(),
                finishDate: Date(),
                comment: "Проверка........................plo0i9uhygtf6g78koplkoiuygtfrdtyuhijokpoijhugytfrdtyuiokplkmjihugytfcryuiopkl[;kojihugytf6yuiokplpkojiuhygtr6yuiopiuyt78uh9io0jkiuytf7yg8uh9ijokoiuy7t6y8uh9ijo0k",
                notification: false,
                debtor: Debtor(fullName: "Ваня", number: 98765433)
            )
        ]
    }
}

enum Parameters: String, CaseIterable {
    case amount = "Сумма:"
    case startDate = "Дата начала:"
    case finishDate = "Дата окончания:"
    case comment = "Комментарий:"
}
