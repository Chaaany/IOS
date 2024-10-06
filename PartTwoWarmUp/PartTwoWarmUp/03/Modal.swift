//
//  Modal.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/5/24.
//

import SwiftUI

struct Modal: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        VStack {
            Text("메인 페이지 입니다.")
            Button(action: {
//                showModal = true
                showModal.toggle()
            }, label: {
                Text("modal 화면 전환")
            })
        }
        .sheet(isPresented: $showModal, content: {
            Detail(isPresented: $showModal)
        })
        
    }
}

#Preview {
    Modal()
}
