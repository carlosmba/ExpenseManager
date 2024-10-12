//
//  SwiftDataContainer.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 2/08/24.
//

import Foundation
import SwiftData
final class SwiftDataContainer : LocalPersistence{
    
    public static var shared : SwiftDataContainer = SwiftDataContainer()
    private var context : ModelContext
    
    private init(){
        let container = try! ModelContainer(for: TransactionModel.self, configurations: ModelConfiguration())
        context = ModelContext(container)
        
    }
    
    func transactionDao() -> TransactionDAO {
        return TransactionDAOImpl(context: context)
    }
    
    func categoryDAO() -> CategoryDAO {
        return CategoryDAOImpl(context: context)
    }
    
    
}
