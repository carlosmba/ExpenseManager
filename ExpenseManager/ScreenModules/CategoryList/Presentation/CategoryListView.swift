//
//  CategoryListView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 12/10/24.
//

import SwiftUI

struct CategoryListView: View {
    let categories : [Category] // Array de ejemplo con 30 elementos
    let columns = 4
    @Binding var categorySelected : Int
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns)){
                    ForEach(categories, id: \.id) { item in
                        CategoryItem(imageSystemName: item.image, name: item.name, color: item.colorSwift, isSelected: item.id == categorySelected)
                            .onTapGesture {
                                categorySelected = item.id
                            }
                        
                    }
                }
            }.toolbarTitle(title: "Categorias")
        }
    }
    
}

