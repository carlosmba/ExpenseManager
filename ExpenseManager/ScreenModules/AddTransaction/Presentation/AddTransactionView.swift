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
                
                Grid {
                    GridRow{
                        CategoryItem(imageSystemName: "house", name: "Casa", color: .red, isSelected: viewModel.categorySelected == 1)
                        
                        CategoryItem(imageSystemName: "gamecontroller", name: "Juegos", color: .blue, isSelected: viewModel.categorySelected == 2)
                        
                        CategoryItem(imageSystemName: "bus", name: "Autobus", color: .green, isSelected: viewModel.categorySelected == 3)
                    }
                    
                    
                    
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
                
                
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.blue)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Add Transaction")
            
            
        }
    }
}

#Preview {
    AddTransactionView(viewModel: AddTransactionViewModel(type: .expense))
}
