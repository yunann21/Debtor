//
//  AlertViewController.swift
//  Debtor
//
//  Created by Anna Ablogina on 19.03.2024.
//

import UIKit

extension UIViewController {
    func showAlert (withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
