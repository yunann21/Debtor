//
//  StorageManager.swift
//  Debtor
//
//  Created by Anna Ablogina on 23.04.2024.
//

import Foundation
import CoreData

final class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "InfoDebtor")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() -> [DebtInfo] {
        let fetchRequest = DebtInfo.fetchRequest()
        var debtors: [DebtInfo] = []
        do {
            debtors = try StorageManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return debtors
        
    }
    
    func createDebt(name: String, amount: Int, comment: String, finalDate: Date, number: Int, startDate: Date) {
        let infoDebtor = DebtInfo(context: persistentContainer.viewContext)
        infoDebtor.name = name
        infoDebtor.amount = Int64(amount)
        infoDebtor.comment = comment
        infoDebtor.finalDate = finalDate
        infoDebtor.startDate = startDate
        infoDebtor.number = Int64(number)
        
        saveContext()
    }
    
    func deleteDebt(debt: DebtInfo) {
        persistentContainer.viewContext.delete(debt)
        saveContext()
    }
    
        //func editDebt(debt:)
    
    
}
