//
//  LocalUserManager.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 02/04/2024.
//

import Foundation

class LocalUserManager {
    
    static let shared = LocalUserManager()
    
    private let defaults = UserDefaults.standard
    
    enum Keys: String {
        case token = "APP_ACCESS_TOKEN"
    }
    
    func setToken(_ xAuthToken: String) {
        defaults.setValue(xAuthToken, forKey: Keys.token.rawValue)
        defaults.synchronize()
    }
    
    func getToken() -> String? {
        return defaults.string(forKey: Keys.token.rawValue)
    }
    
    func logOut() {
        defaults.removeObject(forKey: Keys.token.rawValue)
    }
}
