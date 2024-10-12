//
//  CreateCategory.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 29/09/24.
//

import Foundation
protocol CreateCategoryUseCase {
    func execute(model : CategoryModel) async -> Result<Void, ExpenseManagerErrorDomain>
}

final class CreateCategoryUseCaseImpl : CreateCategoryUseCase{
    
    
    private let categoryRepository : CategoryRepository
    
    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    func execute(model: CategoryModel) async -> Result<Void, ExpenseManagerErrorDomain> {
        return await categoryRepository.createCategory(category: model)
    }
    
    
}
