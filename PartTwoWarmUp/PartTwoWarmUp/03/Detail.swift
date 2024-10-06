//
//  Detail.swift
//  PartTwoWarmUp
//
//  Created by Ben on 10/5/24.
//

import SwiftUI

struct Detail: View {
    @Binding var isPresented: Bool
    var body: some View {
        Text("모달 페이지 입니다.2")
        Button(action: {
            isPresented = false
        }, label: {
            Text("닫기")
        })
    }
}

#Preview {
    Detail(isPresented: .constant(true))
}
