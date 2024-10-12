//
//  TransactionType.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 29/07/24.
//

import Foundation
enum TransactionType : String, CaseIterable, Identifiable{
    var id: Self {self}
    
    case income
    case expense
}
