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
    
    var errorMessage : String?
    var isShowCategoryList = false
    var hasAppeared = false
    var isItemCategoryListSelected : Bool = false
    
    var isDisableButton : Bool {
        amount != 0 && categorySelected != 0
    }
    
    
    private let errorMapper : ExpenseManagerPresentableErrorMapper
    
    init(type : TransactionType,errorMapper : ExpenseManagerPresentableErrorMapper) {
        self.transactionType = type
        self.initType = type
        self.errorMapper = errorMapper
        
    }
    
    func onAppears(){
        self.transactionType = initType
    }
    
    func createNewTransaction(){
        
    }
    
    
    
    
    func handleError(error : ExpenseManagerErrorDomain){
        Task{ @MainActor in
            self.errorMessage = errorMapper.map(error: error)
        }
    }
    
    
    
    
    
}
