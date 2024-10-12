//
//  LocalCategoryDataSourceImpl.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 17/08/24.
//

import Foundation
final class LocalCategoryDataSourceImpl : LocalCategoryDataSource{
    
    
    
    private let localPersistence : LocalPersistence
    init(localPersistence: LocalPersistence) {
        self.localPersistence = localPersistence
    }
    
    func fetchCategoriesByType(type: String) async -> Result<[CategoryModel], LocalPersistenceError> {
        return localPersistence.categoryDAO().getAllCategoriesByType(type: type)
    }
    
    func createCategory(model: CategoryModel) async -> Result<Void, LocalPersistenceError> {
        return localPersistence.categoryDAO().create(model: model)
    }
    
    func updateCategory(model: CategoryModel) async -> Result<Void, LocalPersistenceError> {
        return localPersistence.categoryDAO().update(model: model)
    }
    
    func deleteCategory(categoryId: Int) async -> Result<Void, LocalPersistenceError> {
        return localPersistence.categoryDAO().delete(id: categoryId)
    }
    
    
    
    
}
