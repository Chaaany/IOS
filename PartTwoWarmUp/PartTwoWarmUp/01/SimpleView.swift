//
//  SimpleView.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/1/24.
//

import SwiftUI

struct SimpleView: View {
    var body: some View {
        VStack {
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("헤드라인 입니다")
                .font(.headline)
                .bold()
                .padding()
            
            Text("서브헤드라인 입니다")
                .font(.subheadline)
                .padding()
            
            Text("바디 입니다")
                .font(.body)
                .padding()
            
            Button(action: {}, label: {
                Text("Click Me")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                    .bold()

                    
                    
            })
        }
    }
}

#Preview {
    SimpleView()
}
