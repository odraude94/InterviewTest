//
//  Server.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 16/05/21.
//

import UIKit
import Foundation
import Alamofire

class Server{
    
    static let sharedInstance = Server()
    
    ///Generic https request
    func request<T: Decodable>(from: URL, method: HTTPMethod, decodable: T.Type, completion:@escaping (_ details: [T]) -> Void)
                {
           Alamofire.request(from, method: method).responseJSON { response in
                    let result_ = response.data
                    do {
                        let data = try JSONDecoder().decode([T].self, from: result_!)
                        print("data[0] : \(data[0])")
                        completion(data)
                    } catch let e as NSError {
                        print("error : \(e)")
                    }
                }
            }
}
