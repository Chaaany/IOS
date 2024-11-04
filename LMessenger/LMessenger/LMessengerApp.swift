//
//  LMessengerApp.swift
//  LMessenger
//
//  Created by Ben on 10/12/24.
//

import SwiftUI

@main
struct LMessengerApp: App {
    
    @StateObject var container: DIContainer = .init(services: Services())
    
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init())
                .environmentObject(container)
        }
    }
}
