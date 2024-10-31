//
//  CategoryDAO.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 9/08/24.
//

import Foundation
protocol CategoryDAO {
    func getAllCategoriesByType(type : String) -> Result<[CategoryModel], LocalPersistenceError>
    func create(model : CategoryModel) -> Result<Void, LocalPersistenceError>
    func update(model : CategoryModel) -> Result<Void, LocalPersistenceError>
    func delete(id : Int) -> Result<Void, LocalPersistenceError>
    func deleteAll() -> Result<Void, LocalPersistenceError>
}
