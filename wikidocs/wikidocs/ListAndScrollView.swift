//
//  ListAndScrollView.swift
//  wikidocs
//
//  Created by Ben on 11/13/24.
//

import SwiftUI

struct ListAndScrollView: View {
    var body: some View {
        ////        List {
        ////            Text("Item 1")
        ////            Text("Item 2")
        ////            Text("Item 3")
        ////        }
        //
        //        let itemsFirst = ["Item 1", "Item 2", "Item 3"]
        //
        //        List(itemsFirst, id: \.self) { item in
        //            Text(item)
        //        }
        //
        //        let items = [
        //            Item(name: "Item 1"),
        //            Item(name: "Item 2"),
        //            Item(name: "Item 3")
        //        ]
        //
        //        List(items) { item in
        //            HStack {
        //                Image(systemName: "star")
        //                Text(item.name)
        //            }
        //        }
        //
        //        List {
        //            Section(header: Text("Section 1")) {
        //                Text("Item 1")
        //                Text("Item 2")
        //            }
        //            Section(header: Text("Section 2")) {
        //                Text("Item 3")
        //                Text("Item 4")
        //            }
        //        }
        //
        //        ScrollView {
        //            VStack {
        //                ForEach(0..<50) { index in
        //                    Text("Item \(index)")
        //                        .padding()
        //                        .border(Color.gray)
        //                }
        //            }
        //        }
        //
        //        ScrollView(.horizontal) {
        //            HStack {
        //                ForEach(0..<20) { index in
        //                    Text("Item \(index)")
        //                        .padding()
        //                        .border(Color.gray)
        //                }
        //            }
        //        }
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0..<5) { section in
                    Text("Section \(section)")
                        .font(.title)
                        .padding(.top, 20)
                    
                    ForEach(0..<10) { index in
                        Text("Item \(section * 10 + index)")
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(5)
                            .padding(.bottom, 5)
                    }
                }
            }
            .padding()
        }
    }
    
}
struct Item: Identifiable {
    var id = UUID()
    var name: String
}



#Preview {
    ListAndScrollView()
}
