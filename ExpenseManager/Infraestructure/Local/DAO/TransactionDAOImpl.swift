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
    
    func getTransactionsByType(type: String) {
        <#code#>
    }
    
    func create(transaction: TransactionModel) {
        <#code#>
    }
    
    func update(transaction: TransactionModel) {
        <#code#>
    }
    
    func delete(id: Int) {
        <#code#>
    }
    
    
}
