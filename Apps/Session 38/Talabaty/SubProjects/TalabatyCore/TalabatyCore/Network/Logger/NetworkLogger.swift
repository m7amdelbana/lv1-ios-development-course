//
//  NetworkLogger.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 22/03/2024.
//

import Foundation

class NetworkLogger {
    
    func log(_ url: String, 
             _ headers: APIHeaders,
             _ body: Any?, _ statusCode: Int,
             _ serverResponse: String,
             _ error: Error?) {
        #if DEBUG
        print("----------- API Call: Started -----------")
        if (200...299).contains(statusCode) {
            print("✅✅✅ API Call Successed ✅✅✅")
        } else {
            print("🔥🔥🔥 API Call Failed 🔥🔥🔥")
        }
        print("👉🏻 URL: \(url)")
        print("👉🏻 Headers: \(headers)")
        if let body { print("👉🏻 Body: \(body)") }
        print("👉🏻 Status code: \(statusCode)")
        print("👉🏻 Response: \(serverResponse)")
        print("👉🏻 Error: \(String(describing: error))")
        print("----------- API Call: Ended -----------")
        #endif
    }
}
