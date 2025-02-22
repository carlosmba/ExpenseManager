//
//  AddCategoryFactory.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 11/10/24.
//

import Foundation
protocol AddCategoryFactory {
    static func create(typeTransaction : TransactionType) -> AddCategoryView
}

final class AddCategoryFactoryImpl : AddCategoryFactory{
    static func create(typeTransaction : TransactionType) -> AddCategoryView {
        let local = SwiftDataContainer.shared
        let datasource = LocalCategoryDataSourceImpl(localPersistence: local)
        let mapper = CategoryMapper()
        let errorMapper = ExpenseManagerPresentableErrorMapper()
        let repository = CategoryRepositoryImpl(localCategoryDataSource: datasource, mapper: mapper)
        let createCategoryUseCase = CreateCategoryUseCaseImpl(categoryRepository: repository)
        let getCategoriesByType = GetCategoriesByTypeUseCaseImpl(categoryRepository: repository)
        let viewModel = CategoryViewModel(typeTransaction: typeTransaction, createCategoryUseCase: createCategoryUseCase, getCategoriesUseCase: getCategoriesByType, errorMapper: errorMapper)
        let view = AddCategoryView(viewModel: viewModel)
        return view
    }
    
    
}
