//
//  NetworkService.swift
//  Product Viewer
//
//  Created by mariam adly on 19/07/2023.
//

import Foundation
import Alamofire
class NetworkServices {
    
    static func getProducts( completionHandler: @escaping ([Result]?) -> Void ){
        let url = URL(string: "http://www.nweave.com/wp-content/uploads/2012/09/featured.txt")
                guard let newUrl = url else {
                    return
                }
                AF.request(newUrl,method: .get)
                    .validate().response { resp in
                        switch resp.result{
                        case .success(let data):
                            do{
                                if let data = data{
                                    let jsonData =  try JSONDecoder().decode([Result].self, from: data)
                                        completionHandler(jsonData)
                                }
                            }catch{
                                print(error.localizedDescription)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                            completionHandler(nil)
                        }
                    }
        
    }
}
