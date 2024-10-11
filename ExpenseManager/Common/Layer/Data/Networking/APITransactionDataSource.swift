//
//  TransactionDataSource.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 31/07/24.
//

import Foundation
protocol APITransactionDataSource {
    func fetchTransactionsByType(type : String) async -> Result<[TransactionModel], >
}
