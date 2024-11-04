//
//  DIContainer.swift
//  LMessenger
//
//  Created by Ben on 10/16/24.
//

import Foundation

class DIContainer: ObservableObject {
    // TODO: service
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}
