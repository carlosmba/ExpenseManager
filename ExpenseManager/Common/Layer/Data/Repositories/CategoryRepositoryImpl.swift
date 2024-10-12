//
//  CategoryRepositoryImpl.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 21/08/24.
//

import Foundation
final class CategoryRepositoryImpl : CategoryRepository{
    
    
    private let localCategoryDataSource : LocalCategoryDataSource
    
    init(localCategoryDataSource: LocalCategoryDataSource) {
        self.localCategoryDataSource = localCategoryDataSource
    }
    
    func createCategory(category: CategoryModel) async -> Result<Void, ExpenseManagerErrorDomain> {
        var result = await localCategoryDataSource.createCategory(model: category)
        
        guard case .success(let data) = result else {
            return .failure(.generic)
        }

        return .success(data)
    }
    
    func getCategoriesByType(type: String) async -> Result<[CategoryModel], ExpenseManagerErrorDomain> {
        var result = await localCategoryDataSource.fetchCategoriesByType(type: type)
        
        guard case .success(let data) = result else {
            return .failure(.generic)
        }

        return .success(data)
    }
}
