//
//  InfoBanner.swift
//  TalabatyCore
//
//  Created by Mohamed Elbana on 26/04/2024.
//

import Foundation
import NotificationBannerSwift

class InfoBanner {
    
    static let shared = InfoBanner()
    
    func showError(with message: String) {
        let banner = NotificationBanner(title: "Something went wrong!",
                                        subtitle: message,
                                        style: .danger)
        banner.show()
    }
}
