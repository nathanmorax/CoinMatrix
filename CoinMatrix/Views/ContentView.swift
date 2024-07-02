//
//  ContentView.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CoinMatrixViewModel()
 
    var body: some View {
        TabView() {
            VStack(spacing: 8) {
                ProfileHeaderView()
                CurrentBalance()
                ScrollView {
                    ChartCryptoView()
                    VStack(alignment: .leading){
                        Text("Cryptos")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(.leading, 20)
                        VStack(spacing: 8) {
                            ForEach(viewModel.cryptoData, id: \.id) { crypto in
                                CryptoRowView(crypto: crypto)
                            }
                            
                        }
                        .listStyle(.plain)
                        .navigationTitle("Crypto Matrix")
                        .padding(.top, 8)
                    }
                    .padding(.top, 8)
                }
            }
            .background(Color(.background))
            
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
            .tabItem { Label("Cryptos", systemImage: "bitcoinsign") }
            
            Text("Contenido de otra pestaña")
                .tabItem { Label("Otro", systemImage: "creditcard") }
        }
        .onAppear() {
            Task {
                await viewModel.fetchCryptos()
            }

        }
    }
    
}

#Preview {
    ContentView()
}
