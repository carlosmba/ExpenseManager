//
//  CategoryMapper.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 7/11/24.
//

import Foundation
final class CategoryMapper{
    func map(models : [CategoryModel]) -> [Category]{
        let categories = models.map { model in
            Category(
                id: model.id,
                name: model.name,
                image: model.icon,
                color: model.color,
                type: TransactionType(rawValue: model.type)!
            )
        }
        return categories
    }
}
