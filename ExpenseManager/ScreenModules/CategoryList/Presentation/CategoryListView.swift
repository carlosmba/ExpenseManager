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
    @Binding var isItemCategoryListSelected : Bool
    @State var isShowCreateCategory : Bool  = false
    
    var body: some View {
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
                                    if (isItemCategoryListSelected){initialCategories.removeFirst()} else{ initialCategories.removeLast()}
                                    initialCategories.insert(item, at: 0)
                                    isItemCategoryListSelected = true
                                }
                                
                                categorySelected = item.id
                                isShowCategoryList.toggle()
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
                        self.isShowCreateCategory.toggle()
                    }
                }
            }.toolbarTitle(title: "Categorias")
                .navigationDestination(isPresented: self.$isShowCreateCategory){
                    AddCategoryFactoryImpl.create(typeTransaction: .expense)
                }
        
    }
    
}

