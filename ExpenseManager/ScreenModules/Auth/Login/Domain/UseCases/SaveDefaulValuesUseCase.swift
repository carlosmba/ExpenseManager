//
//  SaveDefaulValuesUseCase.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 30/10/24.
//

import Foundation
protocol SaveDefaulValuesUseCase {
    func execute(categories : [CategoryModel]) async -> Result<Void, ExpenseManagerErrorDomain>
}

final class SaveDefaulValuesUseCaseImpl : SaveDefaulValuesUseCase{
    
    private let categoryRepository : CategoryRepository
    
    
    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    func execute(categories : [CategoryModel]) async -> Result<Void, ExpenseManagerErrorDomain> {
        return await categoryRepository.createCategories(categories: categories)
    }
    
    
}
