//
//  OnboardingViewModel.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import Foundation

class OnboardingViewModel {
    
    var list: [OnboardingModel] {
        return [
            .init(
                image: "onboardning-1",
                title: "Onboarding.onboardning-1.title".localized,
                desc: "Onboarding.onboardning-1.description".localized
            ),
            .init(
                image: "onboardning-2",
                title: "Onboarding.onboardning-2.title".localized,
                desc: "Onboarding.onboardning-2.description".localized
            ),
            .init(
                image: "onboardning-3",
                title: "Onboarding.onboardning-3.title".localized,
                desc: "Onboarding.onboardning-3.description".localized
            )
        ]
    }
    
    init() {
        
    }
}
