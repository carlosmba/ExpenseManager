//
//  DefaultValues.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 13/10/24.
//

import Foundation
struct DefaultValues {
    static let incomeCategories : [CategoryModel] = [
        CategoryModel(name: "Salario", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "dollarsign.circle", color: "red"),
        CategoryModel(name: "Regalo", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "giftcard", color: "red"),
        CategoryModel(name: "Interés", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Otros", type: TransactionType.income.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),

    ]
    
    static let expenseCategories : [CategoryModel] = [
        CategoryModel(name: "Salud", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Ocio", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Casa", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Café", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Educación", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Regalos", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Alimentación", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Familia", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Rutina", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Transporte", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Otros", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
        CategoryModel(name: "Prestamo", type: TransactionType.expense.rawValue, monthlyAmount: 0, icon: "bolt.heart", color: "red"),
    
    ]
}
