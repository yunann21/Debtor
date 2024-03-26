//
//  AlertViewController.swift
//  Debtor
//
//  Created by Anna Ablogina on 19.03.2024.
//

import UIKit

extension UIViewController {
    func showAlert (
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) {_ in
            completion?()}
        alert.addAction(okAction)
            self.present(alert, animated: true)
    }
    
        /* 
     func registerForTraitChanges(
        _ traits: [UITrait],
        action: Selector
    ) -> UITraitChangeRegistration {
        return UITraitChangeRegistration()
    }
         */
    
}
