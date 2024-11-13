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
        SliderView()
        buttonView
        TextFieldView()
        SecureTextView()
        ToggleView()
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

struct TextFieldView: View {
    @State var name: String = ""
    @State var secondName: String = ""
    @State var email: String = ""
    var body: some View {
        VStack{
            TextField("Enter your name", text: $name)
                .font(.title)
                .foregroundColor(.blue)
                .background(Color.yellow)
                .padding()
                .frame(width: 200)
                .border(Color.gray, width: 1)
                .cornerRadius(5)
            Text("My Name: \(name)")
            
            TextField("Enter your name", text: $secondName) { isEditing in
                print("Is editing: \(isEditing)")
            } onCommit: {
                print("Commit: \(self.$secondName)")
            }

            Text("Commit: \(secondName)")
        }
    }
}

struct SecureTextView: View {
    @State var password: String = ""
    var body: some View {
        SecureField("Enter your password", text: $password)
            .padding()
            .border(Color.gray, width: 1)
            .onSubmit {
                print(self.$password)
            }
        
        
        
    }
}

struct ToggleView: View {
    @State private var isOn: Bool = false

    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Enable feature")
        }
        .padding()
        .background(isOn ? Color.green : Color.red)
        .cornerRadius(10)
        .onChange(of: isOn) {
            print("isOn: \(isOn)")
        }
    }
}


#Preview {
    ContentView()
}
