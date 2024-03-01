//
//  NetworkManager.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import Foundation

class NetworkManager {
    
    func request<T: Codable>(
        type: T.Type?,
        of endpint: Endpoint,
        completion: @escaping (APIResponse<T>) -> ()) {
            guard let url = URLComponents(endpint).url else { return }
            
            var request = URLRequest(
                url: url,
                timeoutInterval: Constants.API.timeoutInterval)
            request.httpMethod = endpint.method.rawValue
            request.allHTTPHeaderFields = endpint.headers
            
            /*
             if let body = endpint.body,
             ![HTTPMethod.get, HTTPMethod.delete].contains(endpint.method) {
             guard let dic = (body as? Codable)?.asDictionary() else { return }
             request.httpBody = try? JSONSerialization.data(withJSONObject: dic)
             }
             */
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data else {
                    let error = APIError(0, "No data found")
                    return completion(.onFailure(error))
                }
                
                guard let response = response as? HTTPURLResponse else {
                    let error = APIError(0, "Can't cast response")
                    return completion(.onFailure(error))
                }
                
                guard 200 ... 299 ~= response.statusCode else {
                    guard let fail = try? JSONDecoder().decode(Fail.self, from: data) else {
                        let error = APIError(response.statusCode, "Something went worng")
                        return completion(.onFailure(error))
                    }
                    
                    let error = APIError(response.statusCode, fail.message)
                    return completion(.onFailure(error))
                }
                
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    return completion(.onSuccess(decoded))
                } catch {
                    let error = APIError(response.statusCode, error.localizedDescription)
                    return completion(.onFailure(error))
                }
                
            }.resume()
        }
}
