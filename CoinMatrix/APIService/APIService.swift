//
//  APIService.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 28/06/24.
//

import UIKit

class APIService {
    
    static let shared = APIService()
    
    
    /*func fecthData() {
     guard let url = URL(string:  "https://api.coincap.io/v2/assets") else { return }
     //https://v1.formula-1.api-sports.io/races?season=2024&competition=2
     //"https://v1.formula-1.api-sports.io/races?competition=1&season=2019&type=1st Practice"
     var request = URLRequest(url: url)
     
     request.setValue("ea873a39-9d7b-49fc-bb55-7d263f8d7e5d", forHTTPHeaderField: "Authorization")
     
     URLSession.shared.dataTask(with: request) { (data, response, error) in
     guard let data, error == nil else {
     //completion(nil, error)
     return
     }
     do {
     print("data:: ", String(decoding: data, as: UTF8.self))
     let objects = try JSONDecoder().decode(CryptoResponse.self, from: data)
     //completion(objects, nil)
     print("Decoding succesful")
     } catch {
     print("decoding error:", error)
     //completion(nil, error)
     }
     
     }.resume()
     
     }*/
    
    /*func fecthData() async   {
        guard let url = URL(string:  "https://api.coincap.io/v2/assets") else { return }
     
        var request = URLRequest(url: url)
        
        request.setValue("ea873a39-9d7b-49fc-bb55-7d263f8d7e5d", forHTTPHeaderField: "Authorization")
        let (data, response) = try! await URLSession.shared.data(for: request)

        
        do {
            let cryptoModel = try! JSONDecoder().decode(CryptoResponse.self, from: data)
            return cryptoModel
            print("Data Crypto: \(cryptoModel)")
        } catch {
            print("Decoding error")
        }
        
    }*/
}
