//
//  LocalClient.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 1/08/24.
//

import Foundation
import SwiftData

protocol LocalPersistence{
    func transactionDao() -> TransactionDAO
    func categoryDAO() -> CategoryDAO
}



