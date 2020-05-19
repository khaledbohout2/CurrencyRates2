//
//  DynamicClass.swift
//  CurrencyRates2
//
//  Created by Khaled Bohout on 5/18/20.
//  Copyright © 2020 Khaled Bohout. All rights reserved.
//

import Foundation

class Dynamic<T>: Decodable where T: Decodable {
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    func bind(listener: @escaping Listener) {
        
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
}
