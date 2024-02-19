//
//  NetworkManager.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import Foundation

class NetworkManager {
    
    func request() {
        let stringUrl = "http://198.211.101.142:8079/api/components/categories"
        var request = URLRequest(url: .init(string: stringUrl)!, timeoutInterval: 40.0)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("Request done")
            
            guard let data else {
                print("No data found")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Can't cast response")
                return
            }
            
            guard 200 ... 299 ~= response.statusCode else {
                print("Failure: \(response.statusCode)")
                return
            }
            
            do {
                let page = try JSONDecoder().decode(Page<Category>.self, from: data)
                print("Success")
            } catch {
                print("Failure: \(error.localizedDescription)")
            }
            
        }.resume()
    }
}
