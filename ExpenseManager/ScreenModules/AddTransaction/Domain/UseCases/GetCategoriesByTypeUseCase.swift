//
//  GetCategoriesByType.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 6/11/24.
//

import Foundation
protocol GetCategoriesByTypeUseCase {
    func execute(type : String) async -> Result<[Category], ExpenseManagerErrorDomain>
}

final class GetCategoriesByTypeUseCaseImpl : GetCategoriesByTypeUseCase{
    
    private let categoryRepository : CategoryRepository
    
    init(categoryRepository: CategoryRepository) {
        self.categoryRepository = categoryRepository
    }
    
    func execute(type : String) async -> Result<[Category], ExpenseManagerErrorDomain> {
        return await self.categoryRepository.getCategoriesByType(type: type)
    }
    
    
}
