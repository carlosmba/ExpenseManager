//
//  TransactionDAOImpl.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 2/08/24.
//

import Foundation
import SwiftData
final class TransactionDAOImpl : TransactionDAO{
    
    
    private let context : ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getTransactionsByType(type: String) -> Result<[TransactionModel], LocalPersistenceError> {
        let descriptor = FetchDescriptor<TransactionModel>(
            predicate: #Predicate<TransactionModel> { $0.type == type  }
        )
        do {
            let result = try context.fetch<TransactionModel>(descriptor)
            return .success(result)
        }catch {
            return .failure(.read)
        }
        
    }
    
    func create(transaction: TransactionModel) -> Result<Void, LocalPersistenceError>{
        context.insert(transaction)
        do {
            try context.save()
            return .success(Void())
        }catch {
            return .failure(.write)
        }
    }
    
    func update(transaction: TransactionModel)-> Result<Void, LocalPersistenceError>{
        let transactionId = transaction.id
        let descriptor = FetchDescriptor<TransactionModel>(
            predicate: #Predicate<TransactionModel> { $0.id == transactionId  }
        )
        do {
            let result = try context.fetch<TransactionModel>(descriptor)
            guard let model = result.first else {return .failure(.generic)}
            model.amount = transaction.amount
            model.date = transaction.date
            model.comment = transaction.comment
            model.currencyEquivalence = transaction.currencyEquivalence
            model.equivalence = transaction.equivalence
            model.type = transaction.type
            try context.save()
            return .success(Void())
        }catch {
            return .failure(.read)
        }
    }
    
    func delete(id: Int) -> Result<Void, LocalPersistenceError>{
        let descriptor = FetchDescriptor<TransactionModel>(
            predicate: #Predicate<TransactionModel> { $0.id == id  }
        )
        do {
            let result = try context.fetch<TransactionModel>(descriptor)
            guard let model = result.first else {return .failure(.generic)}
            context.delete(model)
            return .success(Void())
        }catch {
            return .failure(.read)
        }
    }
    
    
    
    
}
