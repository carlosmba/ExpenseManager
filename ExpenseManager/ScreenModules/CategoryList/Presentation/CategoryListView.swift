//
//  CategoryListView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 12/10/24.
//

import SwiftUI

struct CategoryListView: View {
    @Binding var initialCategories : [Category]
    let categories : [Category]
    let columns = 4
    @Binding var categorySelected : Int
    @Binding var isShowCategoryList : Bool
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns)){
                    ForEach(categories.indices, id: \.self) { index in
                        let item = categories[index]
                        CategoryItem(imageSystemName: item.image, name: item.name, color: item.colorSwift, isSelected: item.id == categorySelected)
                            .onTapGesture {
                                
                                let itemAux = initialCategories.first{ aux in
                                    aux.id == item.id
                                }
                                if (itemAux == nil){
                                    initialCategories.removeLast()
                                    initialCategories.insert(item, at: 0)
                                    
                                }
                                
                                categorySelected = item.id
                                isShowCategoryList.toggle()
                            }
                        
                    }
                }
            }.toolbarTitle(title: "Categorias")
        }
    }
    
}

