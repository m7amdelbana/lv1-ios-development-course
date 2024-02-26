//
//  NetworkManager.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import Foundation

class NetworkManager {
    
    func request(of endpint: Endpoint, 
                 completion: @escaping (APIResponse) -> ()) {
        var request = URLRequest(
            url: .init(string: "\(Constants.API.baseUrl)\(endpint.path)")!,
            timeoutInterval: Constants.API.timeoutInterval)
        request.httpMethod = endpint.method.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                return completion(.onFailure("No data found"))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return completion(.onFailure("Can't cast response"))
            }
            
            /// (200 ... 299).contains(response.statusCode)
            guard 200 ... 299 ~= response.statusCode else {
                return completion(.onFailure("Failure with status code: \(response.statusCode)"))
            }
            
            do {
                let page = try JSONDecoder().decode(Page<Category>.self,
                                                    from: data)
                return completion(.onSuccess)
            } catch {
                return completion(.onFailure("Failure: \(error.localizedDescription)"))
            }
            
        }.resume()
    }
}
