//
//  NetworkService.swift
//  Product Viewer
//
//  Created by mariam adly on 19/07/2023.
//

import Foundation
class NetworkServices {
    
    static func getProducts( completionHandler: @escaping ([Result]?) -> Void ){
        let url = URL(string: "http://www.nweave.com/wp-content/uploads/2012/09/featured.txt")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl
        )
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
               guard let data = data else {
                   // Handle empty response data
                   print("Empty response")
                   return
               }
            guard let error = error else {
                // Handle empty response data
                print("Empty response")
                return
            }
            do{
                let result = try JSONDecoder().decode([Result].self, from: data)
                completionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
        }
        task.resume()
        
    }
}
