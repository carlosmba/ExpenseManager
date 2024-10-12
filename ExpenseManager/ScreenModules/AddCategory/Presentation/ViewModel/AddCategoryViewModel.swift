//
//  AddCategoryViewModel.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 11/10/24.
//

import Foundation
import SwiftUI
@Observable
final class AddCategoryViewModel {
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
        "",
    ]
    
    private let createCategoryUseCase : CreateCategoryUseCase
    init(typeTransaction : TransactionType, createCategoryUseCase : CreateCategoryUseCase) {
        self.typeSelected = typeTransaction
        self.createCategoryUseCase = createCategoryUseCase
    }
    
    public func createCategory() async -> Bool{
        self.showSpinnerLoading = true
        let model = CategoryModel(name: nameCategory, type: typeSelected.rawValue, monthlyAmount: Double(amountMounth) ?? 0, icon: iconSelected, color: colorSelected.description)
        
        
        let result = await self.createCategoryUseCase.execute(model: model)
            
        guard case let .success(success) = result else {
            Task{ @MainActor in
                self.showSpinnerLoading = false
                self.messageError = "Ocurrio un error"
            }
            return false
        }
        return true

    }
    
    
}
