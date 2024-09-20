//
//  UIFont+Extensions.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 10/05/2024.
//

import UIKit
import MOLH

enum AppFontWeight: String {
    case light = "Light"
    case regular = "Regular"
    case medium = "Medium"
    case semi = "Semi"
    case demi = "Demi"
    case bold = "Bold"
    case heavy = "Heavy"
    case black = "Black"
}

enum AppFontEnglish: String {
    case light = "Poppins-Light"
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
    case bold = "Poppins-Bold"
}

enum AppFontArabic: String {
    case regular = "GEDinarOneKurdish-Regular"
    case medium = "GEDinarOneKurdish-Medium"
    case bold = "GEDinarOneKurdish-Bold"
}

struct AppFont {
    
    static var light: String {
        let isEn = MOLHLanguage.currentAppleLanguage() == "en"
        return isEn
        ? AppFontEnglish.light.rawValue
        : AppFontArabic.regular.rawValue
    }
    
    static var regular: String {
        let isEn = MOLHLanguage.currentAppleLanguage() == "en"
        return isEn
        ? AppFontEnglish.regular.rawValue
        : AppFontArabic.regular.rawValue
    }
    
    static var medium: String {
        let isEn = MOLHLanguage.currentAppleLanguage() == "en"
        return isEn
        ? AppFontEnglish.medium.rawValue
        : AppFontArabic.medium.rawValue
    }
    
    static var semiBold: String {
        let isEn = MOLHLanguage.currentAppleLanguage() == "en"
        return isEn
        ? AppFontEnglish.semiBold.rawValue
        : AppFontArabic.medium.rawValue
    }
    
    static var bold: String {
        let isEn = MOLHLanguage.currentAppleLanguage() == "en"
        return isEn
        ? AppFontEnglish.bold.rawValue
        : AppFontArabic.bold.rawValue
    }
}

extension UIFontDescriptor.AttributeName {
    static let nsct = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    func setCustomFont(_ systemFontName: String) -> String {
        let fontName = systemFontName.lowercased()
        if fontName.contains(AppFontWeight.light.rawValue.lowercased()) {
            return AppFont.light
        } else if fontName.contains(AppFontWeight.regular.rawValue.lowercased()) {
            return AppFont.regular
        } else if fontName.contains(AppFontWeight.medium.rawValue.lowercased()) {
            return AppFont.medium
        } else if fontName.contains(AppFontWeight.semi.rawValue.lowercased())
                    || fontName.contains(AppFontWeight.demi.rawValue.lowercased()) {
            return AppFont.semiBold
        } else if fontName.contains(AppFontWeight.bold.rawValue.lowercased())
                    || fontName.contains(AppFontWeight.heavy.rawValue.lowercased())
                    || fontName.contains(AppFontWeight.black.rawValue.lowercased()) {
            return AppFont.bold
        } else {
            return AppFont.regular
        }
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard let fontDec = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
              let attribute = fontDec.fontAttributes[.nsct] as? String else {
            self.init(coder: aDecoder)!
            return
        }
        
        var customFontName = ""
        let fontName = attribute.lowercased()
        if fontName.contains(AppFontWeight.light.rawValue.lowercased()) {
            customFontName = AppFont.light
        } else if fontName.contains(AppFontWeight.regular.rawValue.lowercased()) {
            customFontName = AppFont.regular
        } else if fontName.contains(AppFontWeight.medium.rawValue.lowercased()) {
            customFontName = AppFont.medium
        } else if fontName.contains(AppFontWeight.semi.rawValue.lowercased())
                    || fontName.contains(AppFontWeight.demi.rawValue.lowercased()) {
            customFontName = AppFont.semiBold
        } else if fontName.contains(AppFontWeight.bold.rawValue.lowercased())
                    || fontName.contains(AppFontWeight.heavy.rawValue.lowercased())
                    || fontName.contains(AppFontWeight.black.rawValue.lowercased()) {
            customFontName = AppFont.bold
        } else {
            customFontName = AppFont.regular
        }
        self.init(name: customFontName, size: fontDec.pointSize)!
    }
    
    static func fontSwizzling() {
        if let naviteInit = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
           let myInit = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
           method_exchangeImplementations(naviteInit, myInit)
        }
    }
}
