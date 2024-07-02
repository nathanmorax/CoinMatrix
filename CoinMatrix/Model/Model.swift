//
//  Model.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 28/06/24.
//

import UIKit

struct CryptoResponse: Decodable {
    let data: [CryptoData]?
    let timestamp: Int
}

struct CryptoData: Decodable {
    let id: String
    let symbol: String?
    let name: String?
    let supply: String?
    let priceUsd: String?
    let changePercent24Hr: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case supply
        case priceUsd
        case changePercent24Hr
    }
}

