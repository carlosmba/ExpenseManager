//
//  AddCategoryViewModel.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 11/10/24.
//

import Foundation
import SwiftUI
@Observable
final class CategoryViewModel {
    var typeSelected : TransactionType
    var nameCategory : String = ""
    var amountMounth : String = ""
    var iconSelected : String = ""
    var colorSelected : Color = Color.blue
    var isShowIconCatalog = false
    
    var messageError : String?
    var showSpinnerLoading : Bool = false
    
    func isValidFields() -> Bool {
        return !nameCategory.isEmpty && !amountMounth.isEmpty && !iconSelected.isEmpty
    }
    
    var categories : [Category] = [Category]()
    var initialCategories : [Category] = [Category]()
    var errorMessage : String?
    
    var isShowCategoryList : Bool = false
    var isItemCategoryListSelected : Bool = false
    var isShowCreateCategory : Bool  = false
    
    
    
    let defaultIcons = [
        "cart",
        "creditcard",
        "house",
        "car",
        "fuelpump",
        "gamecontroller",
        "dumbbell",
        "iphone.gen1",
        "tv",
        "camera",
        "tshirt",
    ]
    
    private let createCategoryUseCase : CreateCategoryUseCase
    private let getCategoriesByTypeUseCase : GetCategoriesByTypeUseCase
    private let errorMapper : ExpenseManagerPresentableErrorMapper

    init(typeTransaction : TransactionType, createCategoryUseCase : CreateCategoryUseCase, getCategoriesUseCase : GetCategoriesByTypeUseCase,
         errorMapper : ExpenseManagerPresentableErrorMapper
    ) {
        self.typeSelected = typeTransaction
        self.createCategoryUseCase = createCategoryUseCase
        self.getCategoriesByTypeUseCase = getCategoriesUseCase
        self.errorMapper = errorMapper

    }
    
    public func createCategory() async -> Bool{
        self.showSpinnerLoading = true
        let model = CategoryModel(name: nameCategory, type: typeSelected.rawValue, monthlyAmount: Double(amountMounth) ?? 0, icon: iconSelected, color: colorSelected.toString())
        
        
        let result = await self.createCategoryUseCase.execute(model: model)
            
        guard case .success(_) = result else {
            Task{ @MainActor in
                self.showSpinnerLoading = false
                self.messageError = "Ocurrio un error"
            }
            return false
        }
        return true

    }
    
    func getCategories(_ transactionType : TransactionType){
        Task{
            let result = await getCategoriesByTypeUseCase.execute(type: transactionType.rawValue)
            switch result {
            case .success(let categories):
                Task { @MainActor in
                    self.initialCategories = Array(categories.prefix(7))
                    self.categories = categories
                }
                break
            case .failure(let error):
                handleError(error: error)
                break
            }
        }
    }
    
    func handleError(error : ExpenseManagerErrorDomain){
        Task{ @MainActor in
            self.errorMessage = errorMapper.map(error: error)
        }
    }
    
    
}
