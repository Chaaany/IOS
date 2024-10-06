//
//  MyTab.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/5/24.
//

import SwiftUI

struct MyTab: View {
    var body: some View {
        TabView {
            TabDetail()
                .background(.gray)
                .badge(2)
                .tabItem {
                    Label("Received2", systemImage: "tray.and.arrow.down.fill")
                }
            TabDetail2()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            TabDetail3()
                .badge("랑")
//                .badge("라우")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
            Onboarding()
                .badge("랑")
//                .badge("라우")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
//        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    MyTab()
}
