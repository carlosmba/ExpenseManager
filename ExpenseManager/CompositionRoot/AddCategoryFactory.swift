//
//  AddCategoryFactory.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 11/10/24.
//

import Foundation
protocol AddCategoryFactory {
    func create(typeTransaction : TransactionType) -> AddCategoryView
}

final class AddCategoryFactoryImpl : AddCategoryFactory{
    func create(typeTransaction : TransactionType) -> AddCategoryView {
        let local = SwiftDataContainer.shared
        let datasource = LocalCategoryDataSourceImpl(localPersistence: local)
        let repository = CategoryRepositoryImpl(localCategoryDataSource: datasource)
        let createCategoryUseCase = CreateCategoryUseCaseImpl(categoryRepository: repository)
        let viewModel = AddCategoryViewModel(typeTransaction: typeTransaction, createCategoryUseCase: createCategoryUseCase)
        let view = AddCategoryView(viewModel: viewModel)
        return view
    }
    
    
}
