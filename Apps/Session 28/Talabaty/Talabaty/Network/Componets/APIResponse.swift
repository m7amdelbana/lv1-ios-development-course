//
//  APIResponse.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 23/02/2024.
//

import Foundation

enum APIResponse<T: Codable> {
    case onSuccess(T)
    case onFailure(APIError)
}
