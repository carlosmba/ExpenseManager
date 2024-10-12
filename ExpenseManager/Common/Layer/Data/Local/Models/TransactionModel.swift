//
//  TransactionModel.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 1/08/24.
//

import Foundation
import SwiftData
@Model
final class TransactionModel {
    var id : Int
    var amount : Double
    var equivalence : Double
    var currencyEquivalence : String
    var comment : String
    var date : Date
    var type : String
    var category : CategoryModel?
    
    init(id: Int, amount: Double, equivalence: Double, currencyEquivalence: String, comment: String, date: Date, type: String) {
        self.id = id
        self.amount = amount
        self.equivalence = equivalence
        self.currencyEquivalence = currencyEquivalence
        self.comment = comment
        self.date = date
        self.type = type
    }
    
    
}
