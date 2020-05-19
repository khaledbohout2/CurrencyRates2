//
//  CurrencyViewModel.swift
//  CurrencyRates2
//
//  Created by Khaled Bohout on 5/18/20.
//  Copyright © 2020 Khaled Bohout. All rights reserved.
//

import Foundation

struct CurrencyViweModel: Decodable {
    
    var cur: String?
    
    var val: Double?
}

class CurrenciesListViweModel {
    
    var currencies : Dynamic<[CurrencyViweModel]?> = Dynamic(nil)
}

extension CurrenciesListViweModel {

func numberOfRows(section: Int) -> Int {
    return currencies.value!.count
}

func currencyAt(_ Index: Int) -> CurrencyViweModel {
    return (self.currencies.value?[Index])!
}
    
}

extension CurrenciesListViweModel {
    /// This 4th version uses our protocol that has implemented function to call our server, uses a URLRequest builder, to create the request and send it to our network request handler, the function is a wrapper around alamofire, this protocol will free us from adding "import alamofire" in every VC, VM, class we need to call network within.
    func requestRates() {
        // creating request with the builder enum
        RatesRouter.getRates(base: "USD").send(Currencies.self, then: currencyRatesResponse)
    }
    
    var currencyRatesResponse: CallResponse<Currencies> {
        return {(response) in
            switch response {
            case .failure(let error):
                // TODO: - Handle error as you want, printing isn't handling.
                print(error)
            case .success(let value):
                let currencydict = value.rates!
                var currenciesvm = [CurrencyViweModel]()
                for cureency in currencydict {
                    let cur = cureency.key
                    let val = cureency.value
                    var newCur = CurrencyViweModel()
                    newCur.cur = cur
                    newCur.val = val
                    currenciesvm.append(newCur)
                }
                self.currencies.value = currenciesvm
            }
        }
    }
}
