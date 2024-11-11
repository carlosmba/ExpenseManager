//
//  LocalCategoryDataSource.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 17/08/24.
//

import Foundation
protocol LocalCategoryDataSource {
    func fetchCategoriesByType(type : String) async -> Result<[CategoryModel], LocalPersistenceError>
    func createCategory(model : CategoryModel)async -> Result<Void, LocalPersistenceError>
    func createCategories(_ models :[CategoryModel])async -> Result<Void, LocalPersistenceError>
    func updateCategory(model : CategoryModel)async -> Result<Void, LocalPersistenceError>
    func deleteCategory(categoryId : Int)async -> Result<Void, LocalPersistenceError>
    func deleteAll()
    
}
