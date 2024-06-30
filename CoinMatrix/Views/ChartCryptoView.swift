//
//  ChartCryptoView.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 29/06/24.
//

import SwiftUI
import Charts
struct CryptoPrice: Identifiable {
    let id = UUID()
    let month: String
    let price: Double
    let color: Color
}
struct ChartCryptoView: View {
    
    @State private var cryptoPrices: [CryptoPrice] = [
        CryptoPrice(month: "Aug", price: 5000, color: .green),
        CryptoPrice(month: "Sep", price: 3000, color: .brown),
        CryptoPrice(month: "Oct", price: 2000, color: .red),
        CryptoPrice(month: "Nov", price: 4500, color: .yellow),
        CryptoPrice(month: "Jan", price: 1000, color: .gray)
    ]
    var body: some View {
        
        HStack {
            VStack {
                HStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("Summary")
                            .foregroundStyle(.white)
                            .font(.headline)

                        Text("Contribution $900/m")
                            .font(.system(.footnote))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Text("3 Month")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color(hue: 1.0, saturation: 0.088, brightness: 0.475).opacity(0.7))
                        .clipShape(Capsule())
                }
                Chart(cryptoPrices) { crypto in
                    BarMark(
                        x: .value("Month", crypto.month),
                        y: .value("Price", crypto.price)
                    )
                    .foregroundStyle(crypto.color)
                }
                .chartXAxis {
                    AxisMarks { value in
                        AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.5))
                    }
                }
                .chartYAxis {
                    AxisMarks { value in
                        AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.5))
                    }
                }
                .frame(height: 180)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(Color.black.opacity(0.7)) // Fondo negro para integrarse mejor
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .background(Color.black)
    }
}


#Preview {
    ChartCryptoView()
}
