//
//  NetworkManager.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 19/02/2024.
//

import Foundation

class NetworkManager {
    
    private var task: URLSessionDataTask? = nil
    private let logger = NetworkLogger()
    
    func request<T: Codable>(
        type: T.Type?,
        of endpint: Endpoint,
        completion: @escaping (APIResponse<T>) -> ()) {
            guard let url = URLComponents(endpint).url else { return }
            
            let request = URLRequest(url: url, endpoint: endpint)
            
            task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                // Check if not internet connection
                // Present alert to user contains retry
                // task?.resume()
                
                self.logAPI(task: self.task,
                            body: endpint.body,
                            data: data,
                            response: response,
                            error: error)
                
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
                    
                    DispatchQueue.main.async {
                        let message = "\(response.statusCode) - \(fail.message)"
                        /// InfoBanner.shared.showError(with: message)
                    }

                    return completion(.onFailure(error))
                }
                
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    return completion(.onSuccess(decoded))
                } catch {
                    let error = APIError(response.statusCode, error.localizedDescription)
                    return completion(.onFailure(error))
                }
                
            }
            
            task?.resume()
        }
    
    private func logAPI(task: URLSessionDataTask?,
                        body: Any?,
                        data: Data?,
                        response: URLResponse?,
                        error: Error?) {
        let url: String = task?.originalRequest?.url?.absoluteString ?? ""
        let headers: APIHeaders = task?.originalRequest?.allHTTPHeaderFields ?? [:]
        let serverResponse: String = String(data: data ?? Data(), encoding: .utf8) ?? ""
        let statusCode: Int = (response as? HTTPURLResponse)?.statusCode ?? 0
        logger.log(url, headers, body, statusCode, serverResponse, error)
    }
}
