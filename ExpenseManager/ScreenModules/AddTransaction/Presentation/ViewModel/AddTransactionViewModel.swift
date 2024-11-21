//
//  AddTransactionViewModel.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 11/10/24.
//

import Foundation

@Observable
final class AddTransactionViewModel {
    var amount : Double = 0
    var transactionType : TransactionType
    let initType : TransactionType
    var categorySelected : Int = 0
    var comment : String = ""
    var categories : [Category] = [Category]()
    var errorMessage : String?
    var isShowCategoryList = false
    
    private let getCategoriesByTypeUseCase : GetCategoriesByTypeUseCase
    private let errorMapper : ExpenseManagerPresentableErrorMapper
    
    init(type : TransactionType, getCategoriesByType : GetCategoriesByTypeUseCase, errorMapper : ExpenseManagerPresentableErrorMapper) {
        self.transactionType = type
        self.initType = type
        self.getCategoriesByTypeUseCase = getCategoriesByType
        self.errorMapper = errorMapper
        
    }
    
    func onAppears(){
        self.transactionType = initType
        getCategories()
    }
    
    func getCategories(){
        Task{
            let result = await getCategoriesByTypeUseCase.execute(type: transactionType.rawValue)
            switch result {
            case .success(let categories):
                Task { @MainActor in
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
