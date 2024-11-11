//
//  DefaultValues.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 13/10/24.
//

import Foundation
struct DefaultValues {
    static let defaultCategories : [CategoryModel] = [
        CategoryModel(id: 1, name: "Salario", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "dollarsign.circle", color: "21618c"),
        CategoryModel(id: 2, name: "Regalo", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "giftcard", color: "21618c"),
        CategoryModel(id: 3, name: "Interés", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "21618c"),
        CategoryModel(id: 4, name: "Otros", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "21618c"),
        
        
        CategoryModel(id: 5, name: "Salud", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "ff5733"),
        CategoryModel(id: 6, name: "Ocio", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "16a085"),
        CategoryModel(id: 7, name: "Casa", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "9b59b6"),
        CategoryModel(id: 8, name: "Café", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "196f3d"),
        CategoryModel(id: 9, name: "Educación", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "a93226"),
        CategoryModel(id: 10, name: "Regalos", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "f4d03f"),
        CategoryModel(id: 11, name: "Alimentación", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "f4d03f"),
        CategoryModel(id: 12, name: "Familia", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "f4d03f"),
        CategoryModel(id: 13, name: "Rutina", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "f4d03f"),
        CategoryModel(id: 14, name: "Transporte", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "f4d03f"),
        CategoryModel(id: 15, name: "Otros", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "f4d03f"),
        CategoryModel(id: 16, name: "Prestamo", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "f4d03f"),

    ]
    
    
}
