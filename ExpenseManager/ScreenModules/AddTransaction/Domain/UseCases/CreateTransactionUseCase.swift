//
//  CreateTransactionUseCase.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 12/01/25.
//

import Foundation
protocol CreateTransactionUseCase {
    func execute(model : TransactionModel) async -> Result<Void, ExpenseManagerErrorDomain>
}

final class CreateTransactionUseCaseImpl {
    private let transactionRepository : TransactionRepository
    
    init(transactionRepository: TransactionRepository) {
        self.transactionRepository = transactionRepository
    }
    
    
    
    
    
}
