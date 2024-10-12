//
//  TextFieldView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 18/07/24.
//

import SwiftUI

struct CustomTextField: View {
    let imageSystemName : String
    let label : String
    var color : Color = .white
    @Binding var value : String
    var body: some View {
        HStack{
            Image(systemName: imageSystemName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(color)
            TextField(text: $value){
                Text(label)
                    .foregroundStyle(color)
                    .bold()
            }
            .font(.title2)
            .foregroundStyle(color)
        }
        
    }
}


