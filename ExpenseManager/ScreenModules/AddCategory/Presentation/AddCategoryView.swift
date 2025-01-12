//
//  AddCategory.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 16/08/24.
//

import SwiftUI

struct AddCategoryView: View {
    @State private var viewModel : AddCategoryViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: AddCategoryViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
            VStack{
                
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: viewModel.iconSelected)
                            .resizable()
                            .foregroundStyle(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20,height: 20)
                            .padding(10)
                            .background(viewModel.colorSelected)
                            .clipShape(Circle())
                        TextField("Nombre de la Categoria", text: $viewModel.nameCategory)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack{
                        Text("Type:")
                            .foregroundStyle(.gray)
                        Picker("Tipo", selection: $viewModel.typeSelected){
                            ForEach(TransactionType.allCases) { type in
                                    Text(type.rawValue.capitalized)
                                }
                            
                        }.frame(width: 120)
                    }
                    
                    Text("Gasto Programado:")
                        .foregroundStyle(.gray)
                        .padding(.top, 5)
                    HStack{
                        TextField("Monto", text: $viewModel.amountMounth)
                            .frame(width: 100)
                            .textFieldStyle(.roundedBorder)
                        Text("\(UserPreferences.currency) Por Mes")
                    }
                    
                    Text("Simbolos:")
                        .foregroundStyle(.gray)
                        .padding(.top, 5)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)){
                       
                        ForEach(viewModel.defaultIcons, id: \.self){ item in
                            
                            CategorySymbol(imageSystemName: item, color: viewModel.colorSelected, isSelected: viewModel.iconSelected == item)
                            .onTapGesture{
                                viewModel.iconSelected = item
                            }
                             
                            
                        }
                        ZStack{
                            Image(systemName: "ellipsis")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:30)
                                .foregroundStyle(.white)
                        }
                        .padding(.all, 30)
                        .background(.yellow)
                        .clipShape(Circle())
                        .onTapGesture{
                            viewModel.isShowIconCatalog.toggle()
                        }
                        
                    }.navigationDestination(isPresented: $viewModel.isShowIconCatalog){
                        IconCatalogView(iconSelected: $viewModel.iconSelected, color: viewModel.colorSelected)
                    }
                }
                
                ColorPicker("Seleccionar Color:", selection: $viewModel.colorSelected)
                Text(viewModel.colorSelected.toString())
                
                
            
                
                
                Button(action: {
                    if(viewModel.isValidFields()){
                        Task{
                            let result = await viewModel.createCategory()
                            if result {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }, label: {
                    Text("Crear")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(viewModel.isValidFields() ? .yellow : .gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding(.top, 20)
                
                Spacer()
            }
            
            .padding()
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.blue)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Add Category")
        
        
    }
}

/*#Preview {
    AddCategoryFactoryImpl().create(typeTransaction: .expense)
}*/
