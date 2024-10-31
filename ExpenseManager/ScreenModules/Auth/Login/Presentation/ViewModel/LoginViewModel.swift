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
    
    private let saveDefaultCategoriesUseCase : SaveDefaulValuesUseCase
    
    init(saveDefaultCategoriesUseCase : SaveDefaulValuesUseCase) {
        self.saveDefaultCategoriesUseCase = saveDefaultCategoriesUseCase
    }
    
    public func saveValuesDefault()async{
        isLoading = true
    }
}
