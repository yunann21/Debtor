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
    
    @IBOutlet var startData: UIDatePicker!
    @IBOutlet var finalData: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func notificationSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func deleteInformation() {
        // + алерт "Вы уверены, что хотите удалить внесенную информацию?"
   
    }
    
    @IBAction func saveInformation() {
    }
    

    
   
}
