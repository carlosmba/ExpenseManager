//
//  LocalTransactionDataSourceImpl.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 4/08/24.
//

import Foundation
final class LocalTransactionDataSourceImpl : LocalTransactionDataSource{
    private let localPersistence : LocalPersistence
    
    init(localPersistence: LocalPersistence) {
        self.localPersistence = localPersistence
    }
    
    func fetchTransactionsByType(type: String) async -> Result<[TransactionModel], LocalPersistenceError> {
        let result = localPersistence.transactionDao().getTransactionsByType(type: type)
        guard case .success(let data) = result else { return .failure(LocalPersistenceError.generic) }
        return .success(data)
    }
    
    func createTransaction(model: TransactionModel) async -> Result<Void, LocalPersistenceError> {
        return localPersistence.transactionDao().create(transaction: model)
    }
    
    func updateTransaction(model: TransactionModel) async -> Result<Void, LocalPersistenceError> {
        return localPersistence.transactionDao().update(transaction: model)
    }
    
    func deleteTransaction(id: Int) async -> Result<Void, LocalPersistenceError> {
        return localPersistence.transactionDao().delete(id: id)
    }
    
    
}
