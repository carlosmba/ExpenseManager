//
//  ExpenseManagerApp.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 15/07/24.
//

import SwiftUI

@main
struct ExpenseManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.locale, .init(identifier: "es"))
        }
    }
    
    /*init() {
        for family in UIFont.familyNames {
            print("Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   - \(name)")
            }
        }
    }*/
}
