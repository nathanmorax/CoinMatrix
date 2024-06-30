//
//  RandomColor.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 29/06/24.
//

import SwiftUI

extension Color {
   public static func randomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
    
}
