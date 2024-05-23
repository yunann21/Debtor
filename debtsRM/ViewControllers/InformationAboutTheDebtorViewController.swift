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
        
        table.register(CustomTableViewCellTF.self, forCellReuseIdentifier: "cellTF")
        table.register(CustomTableViewCellDP.self, forCellReuseIdentifier: "cellDP")
        table.register(CustomTableViewCellTV.self, forCellReuseIdentifier: "cellTV")
        table.register(CustomTableViewCellS.self, forCellReuseIdentifier: "cellS")
        table.register(CustomTableViewCellB.self, forCellReuseIdentifier: "cellB")
        
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
        DebtCellType.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = DebtCellType.convert(rowValue: indexPath.row)
        let labelText = DebtCellType.labelText(for: indexPath.row)
        
        switch cellType {
        case .textFieldCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTF", for: indexPath)
            if let cellTF = cell as? CustomTableViewCellTF {
                cellTF.label.text = labelText
                cellTF.label.isUserInteractionEnabled = false
                return cellTF
            }
        case .dataPickerCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellDP", for: indexPath)
            if let cellDP = cell as? CustomTableViewCellDP {
                cellDP.label.text = labelText
                cellDP.label.isUserInteractionEnabled = false
                return cellDP
            }
        case .textViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTV", for: indexPath)
            if let cellTV = cell as? CustomTableViewCellTV {
                cellTV.label.text = labelText
                cellTV.label.isEnabled = false
                return cellTV
            }
        case .switchCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellS", for: indexPath)
            if let cellS = cell as? CustomTableViewCellS {
                cellS.label.text = labelText
                return cellS
            }
        case .buttonCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellB", for: indexPath)
            if let cellB = cell as? CustomTableViewCellB {
                cellB.buttonExitOrDelete.setTitle("Удалить", for: .normal)
                cellB.buttonSave.setTitle("Редактировать", for: .normal)
                return cellB
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}

