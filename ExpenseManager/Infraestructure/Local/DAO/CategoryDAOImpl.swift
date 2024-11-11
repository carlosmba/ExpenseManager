//
//  CategoryDAOImpl.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 13/08/24.
//

import Foundation
import SwiftData
final class CategoryDAOImpl : CategoryDAO{
    
    
    private let context : ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getAllCategoriesByType(type: String) -> Result<[CategoryModel], LocalPersistenceError> {
        let categoryType = type
        let descriptor = FetchDescriptor<CategoryModel>(
            predicate: #Predicate<CategoryModel> { $0.type == categoryType  }
        )
        do {
            let result = try context.fetch<CategoryModel>(descriptor)
            return .success(result)
        }catch {
            return .failure(.read)
        }
    }
    
    func create(model: CategoryModel) -> Result<Void, LocalPersistenceError> {
        context.insert(model)
        do {
            try context.save()
            return .success(Void())
        }catch {
            return .failure(.write)
        }
    }
    
    func createAll(models: [CategoryModel]) async -> Result<Void, LocalPersistenceError> {
        do{
            try context.transaction {
                for item in models {
                    context.insert(item)
                }
                try context.save()
            }
            return .success(Void())
        }catch {
            return .failure(.write)
        }
        
        
    }
    
    func update(model: CategoryModel) -> Result<Void, LocalPersistenceError> {
        let categoryId = model.id
        var descriptor = FetchDescriptor<CategoryModel>(
            predicate: #Predicate<CategoryModel> { $0.id == categoryId  }
        )
        descriptor.fetchLimit = 1
        do {
            let result = try context.fetch<CategoryModel>(descriptor)
            guard let currentModel = result.first else {return .failure(.generic)}
            currentModel.name = model.name
            currentModel.type = model.type
            currentModel.color = model.color
            currentModel.monthlyAmount = model.monthlyAmount
            try context.save()
            return .success(Void())
        }catch {
            return .failure(.read)
        }
    }
    
    func delete(id: Int) -> Result<Void, LocalPersistenceError> {
        let categoryId = id
        let descriptor = FetchDescriptor<CategoryModel>(
            predicate: #Predicate<CategoryModel> { $0.id == categoryId  }
        )
        do {
            let result = try context.fetch<CategoryModel>(descriptor)
            guard let model = result.first else {return .failure(.generic)}
            context.delete(model)
            return .success(Void())
        }catch {
            return .failure(.write)
        }
    }
    
    
    func deleteAll() {
        do {
            try context.delete(model: CategoryModel.self)
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
