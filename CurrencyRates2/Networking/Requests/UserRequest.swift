//
//  ProjectRouter.swift
//  SwiftCairo-App
//
//  Created by abdelrahman mohamed on 4/21/18.
//  Copyright © 2018 abdelrahman mohamed. All rights reserved.
//

import Foundation
import Alamofire

enum RatesRouter: URLRequestBuilder {

    case getRates(base: String)
    
    // MARK: - Path
    internal var path: String {
        switch self {
        case .getRates:
            return ""
        }
    }

    // MARK: - Parameters
    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
        case .getRates(let base):
            params["base"] = base
        }
        return params
    }
    
    // MARK: - Methods
    internal var method: HTTPMethod {
        return .get
    }
    
    
    
   
}
