//
//  LoginViewModel.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 19/10/24.
//

import Foundation
@Observable
final class LoginViewModel{
    var email : String = ""
    var password : String = ""
    var isPresented : Bool = false
    var isLoading : Bool = false
    var message : String = ""
    
    private let saveDefaultCategoriesUseCase : SaveDefaulValuesUseCase
    private let errorMapper : ExpenseManagerPresentableErrorMapper
    
    init(saveDefaultCategoriesUseCase : SaveDefaulValuesUseCase, errorMapper : ExpenseManagerPresentableErrorMapper) {
        self.saveDefaultCategoriesUseCase = saveDefaultCategoriesUseCase
        self.errorMapper = errorMapper
    }
    
    public func saveValuesDefault(){
        isLoading = true
        Task{ [weak self] in
            let result = await self?.saveDefaultCategoriesUseCase.execute(categories: DefaultValues.defaultCategories )
            switch result {
            case .success: 
                Task{ @MainActor [weak self] in
                    self?.isLoading = false
                    self?.isPresented = true
                }
                break
            case .failure(let error):
                self?.handleError(error: error)
                return
            default: break
            }
            
            

        }
        
    }
    
    private func handleError(error : ExpenseManagerErrorDomain){
        Task{ @MainActor in
            self.isLoading = false
            self.message = "Ocurrio un error"
        }
    }
}
