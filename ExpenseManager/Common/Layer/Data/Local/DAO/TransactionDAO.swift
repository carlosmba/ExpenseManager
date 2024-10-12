//
//  TransactionDAO.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 2/08/24.
//

import Foundation
protocol TransactionDAO {
    func getTransactionsByType(type : String) -> Result<[TransactionModel], LocalPersistenceError>
    func create(transaction : TransactionModel) -> Result<Void, LocalPersistenceError>
    func update(transaction : TransactionModel) -> Result<Void, LocalPersistenceError>
    func delete(id : Int) -> Result<Void, LocalPersistenceError>
}
