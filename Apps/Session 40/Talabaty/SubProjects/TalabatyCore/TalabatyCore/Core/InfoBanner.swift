//
//  InfoBanner.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 26/04/2024.
//

import Foundation
import NotificationBannerSwift

public class InfoBanner {
    
    public static let shared = InfoBanner()
    
    public func showError(title: String = "Something went wrong!",
                          with message: String) {
        let banner = NotificationBanner(title: title,
                                        subtitle: message,
                                        style: .danger)
        banner.show()
    }
    
    public func showInputError(with message: String) {
        let banner = NotificationBanner(title: "Input validation!",
                                        subtitle: message,
                                        style: .danger)
        banner.show()
    }
}
