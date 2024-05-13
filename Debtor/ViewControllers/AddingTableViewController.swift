//
//  AddingTableViewController.swift
//  Debtor
//
//  Created by Anna Ablogina on 15.03.2024.
//

import UIKit

final class AddingTableViewController: UITableViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var commentTextField: UITextView!
    
    @IBOutlet var startDate: UIDatePicker!
    @IBOutlet var finalDate: UIDatePicker!
    
    @IBOutlet var deleteButton: UIButton!
    
    var debt: DebtInfo?
    weak var delegate: AddingTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    
    @IBAction func notificationSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func deleteInformation() {
        guard let debt else {
            navigationController?.popViewController(animated: true)
            return
        }
        var alertBuilder = AlertControllerBuilder(
            title: "Внимание!",
            message: "Вы уверены, что хотите удалить долг?"
        )
        alertBuilder.addAction(
            title: "Да",
            style: .destructive
        ) { [unowned self] in

            #warning("To do: delete debt")
        
            navigationController?.popToRootViewController(animated: true)
            StorageManager.shared.deleteDebt(debt: debt)
            delegate?.reloadData()
            
        }
        alertBuilder.addAction(
            title: "Нет",
            style: .default
        )
        
        present(alertBuilder.build(), animated: true)
    }
    
    @IBAction func saveInformation() {
        guard let text = nameTextField.text ,
              !text.isEmpty else {
            nameTextField.shake()
            showAlert(withTitle: "Ошибка!", andMessage: "Не указаны ФИО")
            return
        }
        
#warning ("убрать провреку на пустоту и символы после того, как сделаем привязку к контактам")
        
        if let text = nameTextField.text, text.contains(where: { $0.isNumber || $0.isPunctuation }) {
            nameTextField.shake()
            let alertBuilder = AlertControllerBuilder(
                title: "Ошибка",
                message: "ФИО не может содержать цифры или знаки препинания"
            )
            alertBuilder.addAction(
                title: "ОК",
                style: .cancel) { [unowned self] in
                    nameTextField.text = ""
                }
            present(alertBuilder.build(), animated: true)
            return
        }
        
        if amountTextField.text!.isEmpty {
            amountTextField.shake()
            showAlert(withTitle: "Ошибка", andMessage: "Не указна сумма долга")
            return
        }
        
        if startDate.date > finalDate.date {
            startDate.shake()
            finalDate.shake()
            let alertBuilder = AlertControllerBuilder(
                title: "Ошибка",
                message: "Дата окончания не может быть раньше стартовой даты"
            )
            alertBuilder.addAction(
                title: "ОК",
                style: .destructive) { [unowned self] in
                    startDate.date = finalDate.date
                }
            present(alertBuilder.build(), animated: true)
        }
        if let debt {
#warning ("добавить функцию обновления данных")
        } else {
            StorageManager.shared.createDebt(name: nameTextField.text ?? "", amount: Int(amountTextField.text ?? "") ?? 0, comment: commentTextField.text ?? "", finalDate: finalDate.date, number: Int(numberTextField.text ?? "") ?? 0, startDate: startDate.date)
        }
        
        
        delegate?.reloadData()
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
 
    private func setupUI() {
        commentTextField.layer.borderColor = UIColor(named: "border")?.cgColor
        commentTextField.layer.cornerRadius = 8
        commentTextField.layer.borderWidth = 1.0 // Установите желаемую толщину рамки
        guard let debt else {
            deleteButton.setTitle("Отмена", for: .normal)
            navigationItem.title = "Новый долг"
            startDate.date = .now
            finalDate.date = startDate.date
            return
        }
        deleteButton.setTitle("Удалить", for: .normal)
        navigationItem.title = "Редактирование"
        
        nameTextField.text = debt.name
        amountTextField.text = debt.amount.description
        numberTextField.text = debt.number.description
        commentTextField.text = debt.comment
     
        startDate.date = debt.startDate ?? Date()
        finalDate.date = debt.finalDate ?? Date()
    }
}

