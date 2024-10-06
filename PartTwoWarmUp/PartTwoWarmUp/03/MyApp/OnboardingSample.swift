//
//  Onboarding1.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/6/24.
//

import SwiftUI

struct OnboardingSample: View {
    
    let onboardingTitle: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            Text(onboardingTitle)
        }
    }
}

#Preview {
    OnboardingSample(onboardingTitle: "온보딩 테스트", backgroundColor: .brown)
}
