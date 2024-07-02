//
//  CurrentBalance.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 29/06/24.
//

import SwiftUI

struct CurrentBalance: View {
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Text("Current Balance")
                    .foregroundStyle(.white)
                    .font(.headline)
                Spacer()
                
                Text("28.4%")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color(hue: 1.0, saturation: 0.088, brightness: 0.475).opacity(0.2))
                    .clipShape(Capsule())
                
            }
            .padding(.horizontal, 10)
            HStack() {
                Text("$")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                
                Text("9,586.86")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
            }
            
        }
    }
    
}

#Preview {
    CurrentBalance()
}
