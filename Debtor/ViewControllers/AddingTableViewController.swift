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
    @IBOutlet var commentTextField: UITextField!
    
    @IBOutlet var startDate: UIDatePicker!
    @IBOutlet var finalDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startDate.date = .now
        finalDate.date = startDate.date
    }
    
    @IBAction func notificationSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func deleteInformation() {
        // + алерт "Вы уверены, что хотите удалить внесенную информацию?"
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveInformation() {
        if nameTextField.text!.isEmpty { // через ! можно?
            showAlert(withTitle: "Ошибка!", andMessage: "Не указаны ФИО")
            return
            
        }
        if let text = nameTextField.text, text.contains(where: { $0.isNumber || $0.isPunctuation }) {
            showAlert(
                withTitle: "Ошибка",
                andMessage: "ФИО не может содержать цифры или знаки препинания", // все знаки препинания или исключить ' ? нужна ли вообще такая проверка?
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
    

    
   
}
