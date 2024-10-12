//
//  ExpenseView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 20/07/24.
//

import SwiftUI
import Charts
enum TimeFrame : String, CaseIterable, Equatable{
    case today = "Today"
    case month = "Month"
    case year = "Year"
}

struct ExpenseView: View {
    @State var selectedTime : TimeFrame = .today
    @State var isShowAddTransaction : Bool = false
    let data = [
        (name: "Salario", sales: 9631),
        (name: "Ropa", sales: 6959),
        (name: "Comida", sales: 4891),
        (name: "Salida", sales: 2506),
        (name: "Trabajo 1", sales: 1777),
        (name: "Dosa", sales: 625),
    ]
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack{
                    Picker("", selection: $selectedTime){
                        ForEach (TimeFrame.allCases, id:\.self){ item in
                            Text(item.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.top, 20)
                    Text("Octubre 2024")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.top, 15)
                    Text("$2736")
                    Chart(data, id: \.name) { name, sales in
                            SectorMark(angle: .value("Value", sales))
                                .foregroundStyle(by: .value("Product category", name))
                    }.frame(width: 300, height: 300)
                    
                    TransactionRow()
                    TransactionRow()
                    
                    Spacer()
                    
                }
                
                Button(action: {
                    isShowAddTransaction.toggle()
                }){
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
            }.padding()
                .navigationDestination(isPresented: $isShowAddTransaction){
                    //AddTransactionView(type: .expense)
                }
                
        }
        
    }
}

#Preview {
    ExpenseView()
}
