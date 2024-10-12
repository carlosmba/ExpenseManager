//
//  CategoryRepository.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 21/08/24.
//

import Foundation
protocol CategoryRepository {
    func createCategory(category : CategoryModel) async -> Result<Void, ExpenseManagerErrorDomain>
    func getCategoriesByType(type : String) async -> Result<[CategoryModel], ExpenseManagerErrorDomain>
}
