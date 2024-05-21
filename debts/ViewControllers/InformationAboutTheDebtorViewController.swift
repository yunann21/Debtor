//
//  InformationAboutTheDebtorController.swift
//  debts
//
//  Created by Anna Ablogina on 21.05.2024.
//

import UIKit

final class InformationAboutTheDebtorViewController: UIViewController {
    
    let informationList = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        informationList.dataSource = self
        informationList.delegate = self
        
    }
    
    
}

extension InformationAboutTheDebtorViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
