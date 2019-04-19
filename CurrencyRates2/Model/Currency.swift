//
//  Currency.swift
//  CurrencyRates
//
//  Created by Khaled Bohout on 3/20/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import Foundation
import Alamofire

class Currency{
    
    private var _currencyValue:Double!
    private var _currencyKey:String!
    
    
    var currencyValue:Double{
        
        if _currencyValue == nil{
           _currencyValue = 0.0
        }
        return _currencyValue
    }
    
    var currencykey:String{
        
        if _currencyKey == nil{
            _currencyKey = ""
        }
        return _currencyKey
    }
    
    init(currencykey:String,currencyval:Double) {
        
        self._currencyKey = currencykey
        self._currencyValue = currencyval
    }
    
    }
