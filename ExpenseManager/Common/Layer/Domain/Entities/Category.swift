//
//  Category.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 15/09/24.
//

import Foundation
import SwiftUI
struct Category{
    var id : Int
    var name : String
    var image : String
    var color : String
    var type : TransactionType
    var isSelected = false
    
    var colorSwift : Color {
        return Color(fromHex: self.color)
    }
}
