//
//  ContentView.swift
//  wikidocs
//
//  Created by Ben on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var age: Int = 10
    
    var body: some View {
        Text("Age: \(age)")
        Button ("Increment"){
            age += 1
        }
        
        Button ("Decrement") {
            age -= 1
        }
        
        Text("Hello, SwiftUI!")
            .font(.largeTitle)
        Text("This is a title")
            .font(.title)
        Text("This is a headline")
            .font(.headline)
        Text("This is a body text")
            .font(.body)
        
        Text("This is a callout font")
            .font(.callout)
        
        Text("This is a footnote font")
            .font(.footnote)
        
        Text("This is a caption font")
            .font(.caption)
        
        Text("Hello, SwiftUI!")
            .padding()
            .font(Font.title)
        
        imageView
        
        buttonView
    }
}

var imageView: some View {
    Image(systemName: "star.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .aspectRatio(contentMode: .fill)
//        .clipShape(Rectangle())
        .overlay {
            Rectangle().stroke(Color.blue, lineWidth: 5)
        }
        .shadow(radius: 10)
    
}

var buttonView: some View {
    var count = 0
    
    return VStack{
        Button ("buton"){
            print("Button tapped")
        }
        
        Button("Test") {
            count += 1
            print(count)
        }
        
        
        Button {
            print("Second Button tapped")
        } label: {
            Text("Second Button")
            Text("Second Button2")
        }
    }

}

#Preview {
    ContentView()
}
