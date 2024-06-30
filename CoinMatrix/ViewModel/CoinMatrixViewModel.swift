//
//  CoinMatrixViewModel.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 28/06/24.
//

import SwiftUI
import CoreData
@MainActor
class CoinMatrixViewModel: ObservableObject {
    
    @Published var cryptoData = [CryptoData]()
    private let dataController = DataController.shared
    
    
    init()  {
        Task {
            await fetchCryptos()
        }
    }
    func fetchCryptos() async {
        
        let lastFetchKey = "lastFetchDate"
        let lastFetchDate = UserDefaults.standard.object(forKey: lastFetchKey) as? Date ?? .distantPast
        let currentDate = Date()
        let hourThreshold: TimeInterval = 1 * 60 * 60
    
        if currentDate.timeIntervalSince(lastFetchDate) > hourThreshold  {
            await fecthData()
            print("Fetch data from API")
            UserDefaults.standard.set(currentDate, forKey: lastFetchKey)
            
        } else {
            
            print("Fetch data from Core Data")
            
            let cryptos = dataController.fecthCryptos()
            self.cryptoData = cryptos.map { crypto in
                CryptoData(id: crypto.id ?? "", symbol: crypto.symbol, name: crypto.name, supply: crypto.supply, priceUsd: crypto.priceUsd, changePercent24Hr: crypto.changePercent24Hr)
            }
        }
    }
    
    
    func fecthData() async   {
        guard let url = URL(string:  "https://api.coincap.io/v2/assets") else { return }
        
        var request = URLRequest(url: url)
        
        request.setValue("ea873a39-9d7b-49fc-bb55-7d263f8d7e5d", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let cryptoData = try JSONDecoder().decode(CryptoResponse?.self, from: data)
            print("data:: ", String(decoding: data, as: UTF8.self))
            self.cryptoData = cryptoData?.data ?? []
            
            dataController.deleteAllCryptos()
            print("Dedelet data")
            for cryptoData in cryptoData?.data ?? [] {
                dataController.addCrypto(from: cryptoData)
            }
            
        } catch {
            print("Decoding error")
        }
        
    }
}
