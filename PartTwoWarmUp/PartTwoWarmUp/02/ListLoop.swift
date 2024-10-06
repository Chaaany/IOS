//
//  ListLoop.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/3/24.
//

import SwiftUI

struct Fruit: Hashable {
    let name: String
    let matchFruitName: String
    let price: Int
}

struct ListLoop: View {
    
    @State var favoriteFruits = [
        Fruit(name: "Apple", matchFruitName: "Apple", price: 2000),
        Fruit(name: "Banana", matchFruitName: "Apple", price: 3000),
        Fruit(name: "mango", matchFruitName: "kiwi", price: 5000)
    ]
    
    @State var fruitName: String = ""
    
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack {
                    TextField("insert fruit name", text: $fruitName)
                    Button(action: {
                        favoriteFruits.append(
                            Fruit(name: fruitName,
                                  matchFruitName: fruitName,
                                  price: 1000))
                    }, label: {
                        Text("insert")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
                .padding()
                
                List {
                    ForEach(favoriteFruits, id: \.self) { fruit in
                        VStack(alignment: .leading, content: {
                            Text("name: \(fruit.name)")
                            Text("matchFruitName: \(fruit.matchFruitName)")
                            Text("price: \(fruit.price)")
                        })
                    }
                    .onDelete(perform: { indexSet in
                        favoriteFruits.remove(atOffsets: indexSet)
                    })
                }
                .navigationTitle("Fruit List")
            }
        }
        
    }
}


#Preview {
    ListLoop()
}
