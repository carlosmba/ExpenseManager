//
//  View+Extensions.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 12/10/24.
//

import Foundation
import SwiftUI
extension View {
    func toolbarTitle(title : String) -> some View{
        self.frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.blue)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle(title)
    }
}
