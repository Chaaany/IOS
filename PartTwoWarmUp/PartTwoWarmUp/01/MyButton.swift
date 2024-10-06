//
//  MyButton.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/1/24.
//

import SwiftUI

struct MyButton: View {
    var buttonTitle: String
    var buttonColor: Color
    var body: some View {

        
        Button(action: {}, label: {
            Text(buttonTitle)
                .padding()
                .background(buttonColor)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(10)
        })
    }
}

#Preview {
    MyButton(buttonTitle: "button 4", buttonColor: .brown)
}
