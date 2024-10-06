//
//  Navigation.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/5/24.
//

import SwiftUI

struct Navigation: View {
    let titles = ["디테일뷰로 이동하기", "디테일뷰로 이동하기2"]
    let descriptions = ["데스티네이션 입니다.", "데스티네이션 입니다.2"]
    @State var showModal: Bool = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach([0, 1], id: \.self) { index in
                    NavigationLink {
                        Text(descriptions[index])
                    } label: {
                        Text(titles[index])
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Text("Add")
                    })
                }
            }
            .sheet(isPresented: $showModal, content: {
                Text("아이템 추가 페이지 입니다.")
            })
            .navigationTitle("네비게이션")
        }
    }
}

#Preview {
    Navigation()
}
