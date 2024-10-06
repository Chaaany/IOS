//
//  ContentView.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
            Image(systemName: "globe")
                .imageScale(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
                .foregroundColor(.accentColor)
            Text("Hello, world")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .padding(.top)
                .badge(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .hueRotation(Angle(degrees: 180))

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
