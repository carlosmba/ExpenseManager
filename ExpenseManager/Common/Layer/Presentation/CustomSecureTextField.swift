//
//  CustomSecureTextField.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 18/07/24.
//

import SwiftUI

struct CustomSecureTextField: View {
    let imageSystemName : String
    let label : String
    @Binding var value : String
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.white)
            SecureField(text: $value){
                Text(label)
                    .foregroundStyle(.white)
                    .bold()
                
            }
            .font(.title2)
            .foregroundStyle(.white)
        }
    }
}

