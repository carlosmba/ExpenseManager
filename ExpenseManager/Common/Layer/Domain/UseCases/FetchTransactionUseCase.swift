//
//  FetchTransactionUseCase.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 28/07/24.
//

import Foundation
protocol FetchTransactionsUseCase {
    func execute(_ type : TransactionType) async -> Result<[Transaction], ExpenseManagerErrorDomain>
}

final class FetchTransactionUseCaseImpl  {
    
    
    
}
