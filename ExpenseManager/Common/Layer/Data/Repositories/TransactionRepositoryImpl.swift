//
//  TransactionRepositoryImpl.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 21/08/24.
//

import Foundation
final class TransactionRepositoryImpl : TransactionRepository{
    private let localTransactionDataSource : LocalTransactionDataSource
    init(localTransactionDataSource: LocalTransactionDataSource) {
        self.localTransactionDataSource = localTransactionDataSource
    }
    
    
}
