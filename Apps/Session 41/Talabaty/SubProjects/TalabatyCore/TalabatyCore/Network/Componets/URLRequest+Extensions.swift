//
//  URLRequest+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 26/04/2024.
//

import Foundation
import MOLH

extension URLRequest {
    
    init(url: URL, endpoint: Endpoint) {
        self.init(url: url, timeoutInterval: Constants.API.timeoutInterval)
        httpMethod = endpoint.method.rawValue
        
        addValue("application/json", forHTTPHeaderField: "Content-Type")
        addValue("application/json", forHTTPHeaderField: "Accept")
        addValue("iOS", forHTTPHeaderField: "Platform")
        
        let currentLanguage = MOLHLanguage.currentAppleLanguage()
        addValue(currentLanguage, forHTTPHeaderField: "lang")
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            addValue(version, forHTTPHeaderField: "Version")
        }
        
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            addValue(buildNumber, forHTTPHeaderField: "Build-Number")
        }
        
        if let token = LocalUserManager.shared.getToken() {
            addValue(token, forHTTPHeaderField: "x-auth-token")
        }
        
        endpoint.headers?.forEach({ key, value in
            addValue(value, forHTTPHeaderField: key)
        })
        
        if let body = endpoint.body,
           ![HTTPMethod.delete, HTTPMethod.get].contains(endpoint.method) {
            guard let dic = (body as? Codable)?.asDictionary() else { return }
            httpBody = try? JSONSerialization.data(withJSONObject: dic)
        }
    }
}
