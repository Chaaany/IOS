//
//  ContentView.swift
//  wikidocs
//
//  Created by Ben on 11/9/24.
//

import SwiftUI

struct SliderView: View {
    @State private var value: Double = 0.5
    
    var body: some View {
        VStack {
            Slider(value: $value, in: 0...1)
                .padding()
            Slider(value: $value, in: 0...100, step: 1)
            HStack {
                Text("0")
                Spacer()
                Text("100")
            }
            
            Slider(value: $value, in: 0...1)
                .accentColor(.purple)
                .padding()
            
            VStack {
                Slider(value: $value, in: 0...1)
                Text("Value: \(value, specifier: "%.2f")")
            }
            .padding()
        }
        .padding()
        
        
    }
}

#Preview {
    SliderView()
}
