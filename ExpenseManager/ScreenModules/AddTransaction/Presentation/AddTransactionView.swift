//
//  AddTransactionView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 23/07/24.
//

import SwiftUI



struct AddTransactionView: View {
    
    @State private var viewModel : AddTransactionViewModel
    
    init(viewModel: AddTransactionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView {
                    VStack(alignment: .leading){
                        Picker("Tipo", selection: $viewModel.transactionType){
                            Text("Icomes").tag(TransactionType.income)
                            Text("Expenses").tag(TransactionType.expense)
                        }.pickerStyle(.segmented)
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
                            ForEach(viewModel.categories.prefix(7), id:\.id){ item in
                                CategoryItem(imageSystemName: item.image, name: item.name, color: item.colorSwift, isSelected: viewModel.categorySelected == item.id)
                            }
                            VStack(alignment: .center){
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30)
                                    .padding(15)
                                    .background(.gray)
                                    .clipShape(Circle())
                                Text("Mas")
                                    .foregroundStyle(.black)
                            }
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                        Text("Comentario").foregroundStyle(.gray)
                            .padding(.top, 10)
                        TextEditor(text: $viewModel.comment)
                            .scrollDisabled(true)
                                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray))
                                        
                         
                            
                            
                        
                        
                        
                        
                        
                        
                        Spacer()
                    }
                }
                
                
                Button(action: {
                   
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
            }.toolbarTitle(title: "Add Transaction")
            
            
        }
        .onAppear{
            viewModel.onAppears()
        }
    }
}

#Preview {
    AddTransactionView(viewModel: AddTransactionViewModel(type: .expense, getCategoriesByType: GetCategoriesByTypeUseCaseImpl(categoryRepository: CategoryRepositoryImpl(localCategoryDataSource: LocalCategoryDataSourceImpl(localPersistence: SwiftDataContainer.shared), mapper: CategoryMapper())), errorMapper: ExpenseManagerPresentableErrorMapper()))
}
