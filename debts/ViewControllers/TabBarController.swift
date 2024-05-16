//
//  TabBarController.swift
//  debts
//
//  Created by Anna Ablogina on 15.05.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let VC1 = MainNavigationController()
        setViewControllers([VC1], animated: true)
    }
    
}

#Preview {
    TabBarController()
}
