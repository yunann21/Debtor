//
//  ListVC.swift
//  debts
//
//  Created by Anna Ablogina on 14.05.2024.
//

import UIKit
final class AddingViewController: UIViewController {
    
    let debtsList: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false // отключение автоконстрейнтов
        table.backgroundColor = .systemBackground
        table.register(CustomTableViewCellTF.self, forCellReuseIdentifier: "cellTF")
        table.register(CustomTableViewCellDP.self, forCellReuseIdentifier: "cellDP")
        table.register(CustomTableViewCellTV.self, forCellReuseIdentifier: "cellTV")
        table.register(CustomTableViewCellS.self, forCellReuseIdentifier: "cellS")
        table.register(CustomTableViewCellB.self, forCellReuseIdentifier: "cellB")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        debtsList.dataSource = self
        debtsList.delegate = self
        
        setupUI()
        setupConstrains()
    }
    
    private func setupUI() {
        title = "Добавить долг"
        view.addSubview(debtsList)
    }
    
    private func setupConstrains() {
        let debtsListConstraints = [
            debtsList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            debtsList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            debtsList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            debtsList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(debtsListConstraints)
    }
}

extension AddingViewController: UITableViewDataSource, UITableViewDelegate {
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
                return cellTF
            }
        case .dataPickerCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellDP", for: indexPath)
            if let cellDP = cell as? CustomTableViewCellDP {
                cellDP.label.text = labelText
                return cellDP
            }
        case .textViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTV", for: indexPath)
            if let cellTV = cell as? CustomTableViewCellTV {
                cellTV.label.text = labelText
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
                cellB.buttonExitOrDelete.setTitle("Отмена", for: .normal)
                cellB.buttonSave.setTitle("Сохранить", for: .normal)
                return cellB
            }
        }
        
        return UITableViewCell()
    }
}
