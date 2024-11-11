//
//  Color+Extensions.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 11/11/24.
//

import Foundation
import SwiftUI
extension Color {
    init(fromHex: String) {
        // Convertir la cadena hexadecimal a un valor numérico
            let hexint32: UInt32 = UInt32(Int(fromHex, radix: 16)!)
            let components = (
                R: CGFloat((hexint32 & 0xFF0000) >> 16) / 255,
                G: CGFloat((hexint32 & 0x00FF00) >> 8) / 255,
                B: CGFloat(hexint32 & 0x0000FF) / 255
            )
            self.init(.sRGB, red: components.R, green: components.G, blue: components.B)
        }

        func toString() -> String {
            let components = UIColor(self).cgColor.components!
                    let r = components[0]
                    let g = components[1]
                    let b = components[2]
                    let a = components[3]
                    return String(format: "%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        }
}
