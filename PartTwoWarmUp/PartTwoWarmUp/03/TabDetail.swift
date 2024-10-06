//
//  TabDetail.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/5/24.
//

import SwiftUI

struct TabDetail: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            Text("This is detail")
        }
    }
}

struct TabDetail2: View {
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack {
                Text("This is detail2")
                
                Button {
                    
                } label: {
                    Text("Continue")
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                    
                }
            }
        }
    }
}

struct TabDetail3: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Text("This is detail3")
        }
    }
}

#Preview {
    TabDetail()
}
