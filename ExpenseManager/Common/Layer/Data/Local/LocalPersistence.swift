//
//  LocalClient.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 1/08/24.
//

import Foundation
import SwiftData
protocol LocalClient{
    
}

final class SwiftDataContainer : LocalClient{
    public static var shared : SwiftDataContainer = SwiftDataContainer()
    private var context : ModelContext
    
    private init(){
        let container = try! ModelContainer(for: TransactionModel.self, configurations: ModelConfiguration())
        context = ModelContext(container)
        
    }
    
    
}
