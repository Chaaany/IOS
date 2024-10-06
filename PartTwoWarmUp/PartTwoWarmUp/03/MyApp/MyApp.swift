//
//  MyApp.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/6/24.
//

import SwiftUI

struct MyApp: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        TabView {
            FirstList()
                .tabItem {
                    Label("first", systemImage: "tray.and.arrow.down.fill")
                }
            
            
            Text("두 번 째 페이지")
                .tabItem {
                    Label("second", systemImage: "tray.and.arrow.down.fill")
                }
            
            Text("세 번 째 페이지")
                .tabItem {
                    Label("third", systemImage: "tray.and.arrow.down.fill")
                }
            Text("네 번 째 페이지")
                .tabItem {
                    Label("fourth", systemImage: "tray.and.arrow.down.fill")
                }
        }
        .sheet(isPresented: $showModal, content: {
            TabView {
                OnboardingSample(onboardingTitle: "온보딩 1", backgroundColor: .blue)

                OnboardingSample(onboardingTitle: "온보딩 2", backgroundColor: .green)
                
                ZStack {
                    Color.gray.ignoresSafeArea()
                    VStack {
                        Text("온보딩3")
                        Button {
                            showModal = false
                        } label: {
                            Text("Start")
                        }
                    }
                }
                
            }
            .tabViewStyle(.page)
        })
        .onAppear{
            showModal = true
        }
    }
}

#Preview {
    MyApp()
}
