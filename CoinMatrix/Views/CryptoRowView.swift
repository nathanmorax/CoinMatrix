//
//  CryptoRowView.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 28/06/24.
//

import SwiftUI

struct CryptoRowView: View {
    let crypto: CryptoData
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            Text(crypto.symbol ?? "")
                .font(.headline)
                .frame(width: 60, height: 60)
                .foregroundStyle(.white)
                .background(Color(hue: 1.0, saturation: 0.088, brightness: 0.475).opacity(0.2))
                .clipShape(.circle)
            
            
            Text(crypto.name ?? "")
                .foregroundStyle(.white)
                .font(.system(size: 12, weight: .medium))
                //.frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: 70, alignment: .leading)

            Spacer()
            
            Text(crypto.priceUsd?.asCurrencyWith6Decimals() ?? "")
                .bold()
                .foregroundStyle(.gray)
                .font(.system(size: 12))
                .frame(width: 70, alignment: .trailing)

            Spacer()
            
            Text(crypto.changePercent24Hr?.asPercentString() ?? "")
                .foregroundStyle(
                    (crypto.changePercent24Hr ?? "0" >= "0") ?
                    Color.green:
                        Color.red)
                .frame(width: 80, alignment: .trailing)
            
            
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
    }
    
}

/*#Preview {
 CryptoRowView(crypto: .init(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "560000011.0000000000000000", maxSupply: "Bitcoin", marketCapUsd: "Bitcoin", volumeUsd24Hr: "Bitcoin", priceUsd: "60789.176", changePercent24Hr: "1.1205162623790834", vwap24Hr: "Bitcoin", explorer: "Bitcoin"))
 }*/
