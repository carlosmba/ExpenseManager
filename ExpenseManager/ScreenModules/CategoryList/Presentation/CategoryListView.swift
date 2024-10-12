//
//  CategoryListView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 12/10/24.
//

import SwiftUI

struct CategoryListView: View {
    let items = Array(1...20) // Array de ejemplo con 30 elementos
    
    // Define las columnas del Grid
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns:columns){
                    ForEach(items, id: \.self) { item in
                        CategoryItem(imageSystemName: "house", name: "Casa", color: .red, isSelected:false)
                        
                    }
                }
            }.toolbarTitle(title: "Categorias")
        }
    }
    
}
#Preview {
    CategoryListView()
}
