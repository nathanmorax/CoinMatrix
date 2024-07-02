//
//  APIService.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 28/06/24.
//

import UIKit

struct APIService {
    static let shared = APIService()
    
    func fetchhData<T: Decodable>() async throws -> T {
        
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else { throw APIError.invalidURL }
        
        do {
            var request = URLRequest(url: url)
            
            request.setValue("ea873a39-9d7b-49fc-bb55-7d263f8d7e5d", forHTTPHeaderField: "Authorization")
            let (data, response) = try await URLSession.shared.data(from: url)
           
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponseStatus
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
                print("data:: ", String(decoding: data, as: UTF8.self))
            } catch {
                throw APIError.decodingError(error.localizedDescription)
            }
        } catch {
            throw APIError.dataTaskError(error.localizedDescription)
        }
        
    }
    
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponseStatus
    case dataTaskError(String )
    case corruptData
    case decodingError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The endpoint URL is ivalid", comment: "")
        case .invalidResponseStatus:
            return NSLocalizedString("The API failed to issue a valid response", comment: "")
        case .dataTaskError(let string):
            return string
        case .corruptData:
            return NSLocalizedString("The data provided appears to be corrupt", comment: "")
        case .decodingError(let string):
            return string
        }
    }
}
