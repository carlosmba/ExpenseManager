//
//  CategoryListView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 12/10/24.
//

import SwiftUI

struct CategoryListView: View {
    let columns = 4
    @Binding var categorySelected : Int
    @Binding var categoryViewModel : CategoryViewModel
    
    
    var body: some View {
            ScrollView{
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns)){
                    ForEach(categoryViewModel.categories.indices, id: \.self) { index in
                        let item = categoryViewModel.categories[index]
                        CategoryItem(imageSystemName: item.image, name: item.name, color: item.colorSwift, isSelected: item.id == categorySelected)
                            .onTapGesture {
                                
                                let itemAux = categoryViewModel.initialCategories.first{ aux in
                                    aux.id == item.id
                                }
                                if (itemAux == nil){
                                    if (categoryViewModel.isItemCategoryListSelected){categoryViewModel.initialCategories.removeFirst()} else{ categoryViewModel.initialCategories.removeLast()}
                                    categoryViewModel.initialCategories.insert(item, at: 0)
                                    categoryViewModel.isItemCategoryListSelected = true
                                }
                                
                                categorySelected = item.id
                                categoryViewModel.isShowCategoryList.toggle()
                            }
                        
                    }
                    
                    VStack(alignment: .center){
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundStyle(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .padding(15)
                            .background(.gray)
                            .clipShape(Circle())
                        Text("Crear")
                            .foregroundStyle(.black)
                    }
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        categoryViewModel.isShowCreateCategory.toggle()
                    }
                }
            }.toolbarTitle(title: "Categorias")
            .navigationDestination(isPresented: $categoryViewModel.isShowCreateCategory){
                    AddCategoryFactoryImpl.create(typeTransaction: .expense)
                }
        
    }
    
}

