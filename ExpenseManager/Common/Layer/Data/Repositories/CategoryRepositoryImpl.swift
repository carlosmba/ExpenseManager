//
//  CategoryRepositoryImpl.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 21/08/24.
//

import Foundation
final class CategoryRepositoryImpl : CategoryRepository{
    private let localCategoryDataSource : LocalCategoryDataSource
    private let mapper : CategoryMapper
    
    init(localCategoryDataSource: LocalCategoryDataSource, mapper : CategoryMapper) {
        self.localCategoryDataSource = localCategoryDataSource
        self.mapper = mapper
    }
    
    func createCategory(category: CategoryModel) async -> Result<Void, ExpenseManagerErrorDomain> {
        let result = await localCategoryDataSource.createCategory(model: category)
        
        guard case .success(let data) = result else {
            return .failure(.generic)
        }

        return .success(data)
    }
    
    func getCategoriesByType(type: String) async -> Result<[Category], ExpenseManagerErrorDomain> {
        let result = await localCategoryDataSource.fetchCategoriesByType(type: type)
        
        guard case .success(let data) = result else {
            return .failure(.generic)
        }

        return .success(mapper.map(models: data))
    }
    
    
    func createCategories(categories: [CategoryModel]) async -> Result<Void, ExpenseManagerErrorDomain> {
        localCategoryDataSource.deleteAll()
        let result = await localCategoryDataSource.createCategories(categories)
        
        guard case .success(let data) = result else {
            return .failure(.generic)
        }

        return .success(data)
    }
    
   
}
