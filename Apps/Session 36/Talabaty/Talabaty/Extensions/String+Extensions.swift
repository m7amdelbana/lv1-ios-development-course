//
//  String+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import Foundation

public extension String {
    
    var localized: String {
        return Bundle.main.localizedString(forKey: self, value: "", table: nil)
    }
    
    func getLocalized(arg: CVarArg...) -> String {
        return String.init(format: self.localized, arg)
    }
}
