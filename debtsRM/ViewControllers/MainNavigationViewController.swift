//
//  MainVC.swift
//  debts
//
//  Created by Anna Ablogina on 14.05.2024.
//

import UIKit

final class MainNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([ListDebtorsViewController()], animated: true)
        navigationBar.prefersLargeTitles = true
        
        
    }
}


