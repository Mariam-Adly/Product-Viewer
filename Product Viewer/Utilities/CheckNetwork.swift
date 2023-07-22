//
//  CheckNetwork.swift
//  Product Viewer
//
//  Created by mariam adly on 21/07/2023.
//

import Foundation
import Alamofire

class CheckNetwork{
    class func isConnectedToInternet() -> Bool {
           return NetworkReachabilityManager()?.isReachable ?? false
       }
    
}
