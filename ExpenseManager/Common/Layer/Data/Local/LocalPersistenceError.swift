//
//  LocalClientError.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 1/08/24.
//

import Foundation
enum LocalPersistenceError : Error {
    case generic
    case read
    case write
}
