//
//  AddTransactionViewModel.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 11/10/24.
//

import Foundation

@Observable
final class AddTransactionViewModel {
    var amount : Double = 0
    var transactionType : TransactionType
    var categorySelected : Int = 3
    var comment : String = ""
    
    init(type : TransactionType) {
        self.transactionType = type
    }
    
    
    
}
