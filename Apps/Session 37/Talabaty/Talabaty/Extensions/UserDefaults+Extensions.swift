//
//  UserDefaults+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import Foundation

public enum UserDefaultsKeys: String {
    case isUserShowOnboading = "isUserShowOnboading"
}

public extension UserDefaults {
    
    func set(key: UserDefaultsKeys, value: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    func getBoolean(key: UserDefaultsKeys) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key.rawValue)
    }
}
