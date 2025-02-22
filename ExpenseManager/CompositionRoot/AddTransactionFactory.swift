//
//  AddTransactionFactory.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 22/02/25.
//

import Foundation
protocol AddTransactionFactory {
    static func create(type : TransactionType) -> AddTransactionView
}
final class AddTransactionFactoryImpl : AddTransactionFactory{
    static func create(type: TransactionType) -> AddTransactionView {
        
        let datasoruce = LocalCategoryDataSourceImpl(localPersistence: SwiftDataContainer.shared)
        let categoryMapper = CategoryMapper()
        let errorMapper = ExpenseManagerPresentableErrorMapper()
        let categoryRepository = CategoryRepositoryImpl(localCategoryDataSource: datasoruce, mapper: categoryMapper)
        let createCategoryUseCase = CreateCategoryUseCaseImpl(categoryRepository: categoryRepository)
        let getCategoriesByTypeUseCase = GetCategoriesByTypeUseCaseImpl(categoryRepository: categoryRepository)
        let categoryViewModel = CategoryViewModel(typeTransaction: type, createCategoryUseCase: createCategoryUseCase, getCategoriesUseCase: getCategoriesByTypeUseCase, errorMapper: errorMapper)
        
        let addTransactionViewModel = AddTransactionViewModel(type: type, errorMapper: errorMapper)
        let view = AddTransactionView(viewModel: addTransactionViewModel, categoryViewModel: categoryViewModel)
        return view
    }
    
    
}
