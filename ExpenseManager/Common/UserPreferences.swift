//
//  UserPreferences.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 29/09/24.
//

import Foundation
final class UserPreferences{
   public static let currency = "Dolares"
   public static let SymbolCurrency = "$"
   public static let userId = 0
    public static let isLocalMode = {
        return userId != 0
    }
}
