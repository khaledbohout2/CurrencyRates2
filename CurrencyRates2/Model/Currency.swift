//
//  Currency.swift
//  CurrencyRates
//
//  Created by Khaled Bohout on 3/20/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import Foundation

// MARK: - Currencies
struct Currencies: Codable, CodableInit {
    
    let rates: [String: Double]?
    let base, date: String?
    
    init() {
        
        self.rates = nil
        self.base = nil
        self.date = nil
    }
}





