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
    
    private let dataController = DataController.shared
    @Published var cryptoData: [CryptoData] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    
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
            
            await loadData()
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
    
    func loadData() async {
        
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            let response: CryptoResponse = try await APIService.shared.fetchhData()
            
            if let data = response.data {
                self.cryptoData = data
                dataController.deleteAllCryptos()
                for cryptoData in cryptoData {
                    dataController.addCrypto(from: cryptoData)
                }
            }
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription + "\n Please contact the developer and provide this error"
        }
    }
    
    // MARK: - Se paso la funcion a clase APIService para hacerla funcion generica
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
