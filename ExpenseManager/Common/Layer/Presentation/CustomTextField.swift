//
//  TextFieldView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 18/07/24.
//

import SwiftUI

struct TextFieldView: View {
    let label : String
    @Binding var value : String
    var body: some View {
        TextField(text: $value){
            Text(label)
                .foregroundStyle(.white)
                .bold()
        }
        .font(.title2)
        .foregroundStyle(.white)
    }
}


