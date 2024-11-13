//
//  StackAndGridView.swift
//  wikidocs
//
//  Created by Ben on 11/13/24.
//

import SwiftUI

struct StackAndGridView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("First")
            Text("Second")
            Text("Third")
        }
        
        ZStack(alignment: .bottom) {
            Text("Back")
            Text("Middle")
            Text("Front")
        }
        
        let columns = [
            GridItem(.fixed(50)),
            GridItem(.fixed(50)),
            GridItem(.fixed(50)),
            GridItem(.fixed(50)),
        ]

        LazyVGrid(columns: columns) {
            ForEach(1..<17) { index in
                Text("\(index)")
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .border(Color.black)
            }
        }
    }
}

#Preview {
    StackAndGridView()
}
