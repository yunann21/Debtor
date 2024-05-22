//
//  InformationAboutTheDebtorController.swift
//  debts
//
//  Created by Anna Ablogina on 21.05.2024.
//

import UIKit

final class InformationAboutTheDebtorViewController: UIViewController {
    
    let informationList: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    let labelName = UILabel()
    let labelNumber = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
//        setupConstrains()
        
        
//        informationList.dataSource = self
//        informationList.delegate = self
        
    }
    
    private func setupConstrains() {
        let informationListConstraints = [
            informationList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            informationList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            informationList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            informationList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(informationListConstraints)
    }
    
    private func setupUI() {
        LabelsForInfoVC.setupLabels(for: view, name: labelName, number: labelNumber)
        
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

