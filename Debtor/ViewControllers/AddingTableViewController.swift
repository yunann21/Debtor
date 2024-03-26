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
    
    var debt: Debt?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        startDate.date = .now
        finalDate.date = startDate.date
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
            print("Удаляем долг")
#warning("To do: delete debt")
            navigationController?.popToRootViewController(animated: true)
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
            showAlert(withTitle: "Ошибка!", andMessage: "Не указаны ФИО")
            return
        }
        
#warning ("убрать провреку на пустоту и символы после того, как сделаем привязку к контактам")
        if let text = nameTextField.text, text.contains(where: { $0.isNumber || $0.isPunctuation }) {
            showAlert(
                withTitle: "Ошибка",
                andMessage: "ФИО не может содержать цифры или знаки препинания",
                completion: {self.nameTextField.text = ""}
            )
            return
        }
        if amountTextField.text!.isEmpty {
            showAlert(withTitle: "Ошибка", andMessage: "Не указна сумма долга")
            return
        }
        if startDate.date > finalDate.date {
            showAlert(
                withTitle: "Ошибка",
                andMessage: "Дата окончания не может быть меньше стартовой даты",
                completion: {
                    self.startDate.date = self.finalDate.date
                }
            )
        }
    }
 
    private func setupUI() {
        commentTextField.layer.borderColor = UIColor(named: "border")?.cgColor
        commentTextField.layer.cornerRadius = 8
        commentTextField.layer.borderWidth = 1.0 // Установите желаемую толщину рамки
        guard let debt else {
            deleteButton.setTitle("Отмена", for: .normal)
            navigationItem.title = "Новый долг"
            return
        }
        deleteButton.setTitle("Удалить", for: .normal)
        navigationItem.title = "Редактирование"
        
        nameTextField.text = debt.debtor.fullName
        amountTextField.text = debt.amountOfDebt.description
        numberTextField.text = debt.debtor.number.description
        commentTextField.text = debt.comment
        
        startDate.date = debt.startDate
        finalDate.date = debt.finishDate
    }
}


