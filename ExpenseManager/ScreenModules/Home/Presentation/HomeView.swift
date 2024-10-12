//
//  HomeView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 20/07/24.
//

import SwiftUI

struct HomeView: View {
    @State var isShowAccounts = false
    var body: some View {
        NavigationStack {
            TabView{
                ExpenseView()
                    .tabItem {
                        Label("Expenses", systemImage: "list.dash")
                    }
                IncomeView()
                    .tabItem {
                        Label("Incomes", systemImage: "square.and.pencil")
                    }
                    
            }.toolbar {
                ToolbarItem(placement:.principal){
                    VStack {
                        Button(action: {
                            isShowAccounts.toggle()
                        }, label: {
                            HStack{
                                Image(systemName: "dollarsign.circle.fill")
                                Text("Total")
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .frame(width: 10, height: 8)
                            }.foregroundStyle(.white)
                                
                        })
                    }.sheet(isPresented: $isShowAccounts){
                        VStack(alignment: .leading){
                            Text("Seleccione una cuenta").font(.title2)
                                .padding(.top, 15)
                            HStack{
                                Image(systemName: "dollarsign.circle")
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.gray)
                                    .clipShape(Circle())
                                VStack{
                                    Text("Principal")
                                        .font(.title3)
                                    Text("$ 10.000")
                                        .font(.subheadline)
                                }
                            }
                            Spacer()
                        }
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .presentationDetents([.medium])
                            .presentationCornerRadius(10)
                            
                    }
                }
            }
            .toolbarBackground(.blue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    HomeView()
}
