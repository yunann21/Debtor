//
//  MainVC.swift
//  debts
//
//  Created by Anna Ablogina on 14.05.2024.
//

import UIKit

final class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([AddingViewController()], animated: true)
        navigationBar.prefersLargeTitles = true
        
    }
}


