//
//  TabBarController.swift
//  debts
//
//  Created by Anna Ablogina on 15.05.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let VC1 = MainNavigationViewController()
        setViewControllers([VC1], animated: true)
        VC1.tabBarItem.image = UIImage(systemName: "book.fill")
        VC1.title = "История"
    }
    
}

#Preview {
    TabBarViewController()
}
