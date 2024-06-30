//
//  Formatter.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 28/06/24.
//

import UIKit

extension String {
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func asCurrencyWith6Decimals() -> String {
        guard let doubleValue = Double(self) else {
            return "0.00"
        }
        
        let number = NSNumber(value: doubleValue)
        return currencyFormatter6.string(from: number) ?? "0.00"
    }
    
    func asNumberString() -> String {
           if let doubleValue = Double(self) {
               return String(format: "%.2f", doubleValue)
           } else {
               return "0.00"
           }
       }
       
       func asPercentString() -> String {
           return asNumberString() + "%"
       }
}

