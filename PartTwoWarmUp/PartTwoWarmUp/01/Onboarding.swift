//
//  Onboarding.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/3/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack {
            Text("What's New in Photos")
                .font(.system(size: 35))
                .bold()
//                .padding()
                .padding(.vertical, 30)
            
            HStack {
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.horizontal, 7)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, content: {
                    Text("Albums in the Phtos Widget")
                        .font(.headline)
                    Text("Enjoy your photos from any custom album in the Photos widget.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                })
            }
            .padding(.leading)
            .padding(.vertical)
            
            HStack {
                Image(systemName: "pawprint")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.horizontal, 7)
                    .foregroundColor(.blue)
                VStack(alignment: .leading, content: {
                    
                    Text("Pets Albums")
                        .font(.headline)
                    Text("Find photos and videos of your cat or dog in the Albums tab, along with people.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                })
            }
            .padding(.leading)
            .padding(.vertical)
            
            HStack {
                Image(systemName: "crop.rotate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.horizontal, 7)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, content: {
                    Text("Pinch to Crop")
                        .font(.headline)
                    Text("Crop, rotate, or flip any photo faster by \t\t pinching to zoom, then tapping Crop.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                })
            }
            .padding(.leading)
            .padding(.vertical)

            HStack {
                Image(systemName: "memories")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .padding(.horizontal, 7)
                    .foregroundColor(.blue)
                VStack(alignment: .leading, content: {
                    
                    Text("More Customizable Memories")
                        .font(.headline)
                    Text("Reorder the photos and vieeos in a Memory \t or add any photo from your library.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                })
            }
            .padding(.leading)
            .padding(.vertical)
            
            Button(action: {}, label: {
                Text("Continue")
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            })
            .padding(.top, 150)
        }
    }
}

#Preview {
    Onboarding()
}
