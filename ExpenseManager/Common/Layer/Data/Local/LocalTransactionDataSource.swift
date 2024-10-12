//
//  LocalTransactionDataSource.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 2/08/24.
//

import Foundation
protocol LocalTransactionDataSource {
    func fetchTransactionsByType(type : String) async -> Result<[TransactionModel], LocalPersistenceError>
    func createTransaction(model : TransactionModel) async -> Result<Void, LocalPersistenceError>
    func updateTransaction(model : TransactionModel) async -> Result<Void, LocalPersistenceError>
    func deleteTransaction(id : Int) async -> Result<Void, LocalPersistenceError>
}
