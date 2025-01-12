//
//  CategoryItem.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 24/07/24.
//

import SwiftUI

struct CategoryItem: View {
    let imageSystemName : String
    let name : String
    let color : Color
    let isSelected : Bool
    
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: imageSystemName)
                .resizable()
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(15)
                .background(color)
                .clipShape(Circle())
            Text(name)
                .font(.system(size: 14))
                .foregroundStyle(isSelected ? .white : .black)
                .lineLimit(1)
        }
        .padding(5)
        .background(isSelected ? color : nil)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CategoryItem(imageSystemName: "phone", name: "Casa", color: .red, isSelected: true)
}
