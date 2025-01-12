//
//  AllSymbolsView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 8/09/24.
//

import SwiftUI

struct IconCatalogView: View {
    
    @Binding var iconSelected : String
    let color : Color
    let commerce = [
        "bag",
        "cart",
        "giftcard",
        "creditcard",
        "basket",
        "dollarsign.circle",
        "sterlingsign.circle",
        "eurosign.circle"
    ]
    
    let transport = [
        "airplane.departure",
        "car.rear",
        "bus.fill",
        "tram",
        "bicycle",
        "scooter",
        "fuelpump",
        "ferry"
    ]
    let rows : Int = 2
    let columns : Int = 4
    var body: some View {
            ScrollView {
                VStack(alignment: .leading){
                    Text("Comercio:")
                    Grid{
                        ForEach(0..<rows, id: \.self){row in
                            GridRow{
                                ForEach(0..<columns, id: \.self){ column in
                                    let index = row * 4 + column
                                    if index < commerce.count {
                                        let image = commerce[index]
                                        CategorySymbol(imageSystemName: image, color: color, isSelected: self.iconSelected == image).onTapGesture{
                                            self.iconSelected = image
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    Text("Transporte:")
                    Grid{
                        ForEach(0..<rows, id: \.self){row in
                            GridRow{
                                ForEach(0..<columns, id: \.self){ column in
                                    let index = row * 4 + column
                                    if index < transport.count {
                                        let image = transport[index]
                                        CategorySymbol(imageSystemName: image, color: color, isSelected: self.iconSelected == image).onTapGesture{
                                            self.iconSelected = image
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }.padding()
            }
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(ColorScheme.primary)
                .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle("Icons")
        
        
    }
}

#Preview {
    IconCatalogView(iconSelected: .constant("bag"), color: .blue)
}
