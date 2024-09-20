//
//  UIDevice+Extensions.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 18/09/2024.
//

import UIKit

public extension UIDevice {
    
    var isIPhone: Bool {
        return userInterfaceIdiom == .phone
    }
    
    var isIPad: Bool {
        return userInterfaceIdiom == .pad
    }
}
