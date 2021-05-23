//
//  Api.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 16/05/21.
//

import UIKit

struct Api {
    
    struct ws {
        
        private static let domain = "https://restcountries.eu/rest/v2"
        
        struct get {
            static let all: String = domain + "/all"
        }
    }

}
