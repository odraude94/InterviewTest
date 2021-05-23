//
//  Country.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 15/05/21.
//

import UIKit
import Realm
import RealmSwift

@objcMembers class Country: Object, Decodable{
    
    dynamic var name: String = ""
    dynamic var capital: String = ""
    dynamic var flag: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case flag
    }
   
}

