//
//  Encodable+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 01/03/2024.
//

import Foundation

extension Encodable {
    
    func asDictionary() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return nil }
            return dictionary
        } catch {
            return nil
        }
    }
}
