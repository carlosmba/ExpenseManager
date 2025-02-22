//
//  AddTransactionView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 23/07/24.
//

import SwiftUI



struct AddTransactionView: View {
    
    @State private var viewModel : AddTransactionViewModel
    @State private var categoryViewModel : CategoryViewModel
    
    init(viewModel: AddTransactionViewModel, categoryViewModel : CategoryViewModel) {
        self.viewModel = viewModel
        self.categoryViewModel = categoryViewModel
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading){
                    Picker("Tipo", selection: $viewModel.transactionType){
                        Text("Icomes").tag(TransactionType.income)
                        Text("Expenses").tag(TransactionType.expense)
                    }.pickerStyle(.segmented)
                        .onChange(of: viewModel.transactionType, initial: false ){
                            categoryViewModel.getCategories(viewModel.transactionType)
                        }
                    Text("Cuenta").foregroundStyle(.gray)
                        .padding(.top, 10)
                    Text("Principal")
                    HStack{
                        TextField(value: $viewModel.amount, format: .number) {
                            Text("Monto")
                        }.font(.system(size: 30))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text(UserPreferences.currency)
                            .font(.system(size: 25))
                    }.frame(width: 200)
                    Text("Categorias").foregroundStyle(.gray)
                        .padding(.top, 10)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)){
                        ForEach(categoryViewModel.initialCategories, id:\.id){ item in
                            CategoryItem(imageSystemName: item.image, name: item.name, color: item.colorSwift, isSelected: viewModel.categorySelected == item.id)
                                .onTapGesture {
                                    viewModel.categorySelected = item.id
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
                            Text("Mas")
                                .foregroundStyle(.black)
                        }
                        .padding()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            viewModel.isShowCategoryList.toggle()
                        }
                    }

                    Text("Comentario").foregroundStyle(.gray)
                        .padding(.top, 10)
                    TextEditor(text: $viewModel.comment)
                        .scrollDisabled(true)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray))
 
                    Spacer()
                }
            }.navigationDestination(isPresented: $viewModel.isShowCategoryList){
                CategoryListView(categorySelected: $viewModel.categorySelected, categoryViewModel: $categoryViewModel)
            }
            
            
            Button(action: {
               print("Creando transaccion")
            }, label: {
                Text("Crear")
                    .fontWeight(.heavy)
                    .font(.title3)
                    .frame(width:200)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            })
            .disabled(viewModel.isDisableButton)
        }.toolbarTitle(title: "Add Transaction")

        .onAppear{
            if !viewModel.hasAppeared{
                viewModel.onAppears()
                viewModel.hasAppeared.toggle()
            }
            
        }
    }
}

#Preview {
    AddTransactionFactoryImpl.create(type: .income)
}
