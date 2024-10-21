//
//  CategoryModel.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 9/08/24.
//

import Foundation
import SwiftData

@Model
final class CategoryModel{
    @Attribute(.unique) var id : Int
    var name : String
    var type : String
    var monthlyAmount : Double
    var icon : String
    var color : String
    @Relationship(deleteRule: .cascade, inverse: \TransactionModel.category)
    var transactions : [TransactionModel] = [TransactionModel]()
    
    init(id: Int = 0, name: String, type: String, monthlyAmount: Double, icon: String, color: String) {
        self.id = id
        self.name = name
        self.type = type
        self.monthlyAmount = monthlyAmount
        self.icon = icon
        self.color = color
    }
}
