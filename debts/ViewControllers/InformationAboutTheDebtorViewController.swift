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
        
        informationList.dataSource = self
        informationList.delegate = self
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        setupTableConstrains()
        
    }
    
    private func setupTableConstrains() {
        let informationListConstraints = [
            informationList.topAnchor.constraint(equalTo: labelNumber.bottomAnchor , constant: 10),
            informationList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            informationList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            informationList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(informationListConstraints)
        
    }
    
    private func setupUI() {
        LabelsForInfoVC.setupLabels(for: view, name: labelName, number: labelNumber)
        title = "Информация о долге"
        view.addSubview(informationList)
    }
    
}

extension InformationAboutTheDebtorViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}

