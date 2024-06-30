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
    //let rank: String?
    let symbol: String?
    let name: String?
    let supply: String?
    //let maxSupply: String?
    //let marketCapUsd: String?
    //let volumeUsd24Hr: String?
    let priceUsd: String?
    let changePercent24Hr: String?
    //let vwap24Hr: String?
    //let explorer: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        //case rank
        case symbol
        case name
        case supply
        //case maxSupply
        //case marketCapUsd
        //case volumeUsd24Hr
        case priceUsd
        case changePercent24Hr
        //case vwap24Hr
        //case explorer
    }
}

