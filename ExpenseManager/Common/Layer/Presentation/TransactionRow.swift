//
//  TransactionRow.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 25/07/24.
//

import SwiftUI

struct TransactionRow: View {
    var body: some View {
        HStack{
            Image(systemName: "bus")
                .resizable()
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .padding(10)
                .background(.red)
                .clipShape(Circle())
            
            Text("Autobus")
            Spacer()
            Text("100%")
                .foregroundStyle(.gray)
                .padding(.horizontal, 10)
            Text("$130")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

#Preview {
    TransactionRow()
}
