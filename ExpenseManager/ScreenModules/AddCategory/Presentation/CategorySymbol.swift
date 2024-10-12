//
//  CategorySymbol.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 1/09/24.
//

import SwiftUI

struct CategorySymbol: View {
    let imageSystemName : String
    let color : Color
    let isSelected : Bool
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: imageSystemName)
                .resizable()
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(15)
                .background(isSelected ? color : .gray)
                .clipShape(Circle())
        }
        .padding(7)
        .background(isSelected ? Color.white : nil)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: isSelected ? 10 : 0)
    }
    }


#Preview {
    CategorySymbol(imageSystemName: "giftcard", color: .red, isSelected: true)
        
}
