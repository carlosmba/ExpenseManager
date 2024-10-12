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
                .frame(width: 50)
                .padding(15)
                .background(color)
                .clipShape(Circle())
            Text(name)
                .foregroundStyle(isSelected ? .white : .black)
        }
        .padding()
        .background(isSelected ? color : nil)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CategoryItem(imageSystemName: "house", name: "Casa", color: .red, isSelected: true)
}
