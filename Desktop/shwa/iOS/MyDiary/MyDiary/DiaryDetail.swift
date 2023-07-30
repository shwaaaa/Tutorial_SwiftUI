//
//  DiaryDetail.swift
//  MyDiary
//
//  Created by 이승화 on 2023/07/30.
//

import SwiftUI

struct DiaryDetail: View {
//    @EnvironmentObject var store: DiaryStore
//    @ObservedObject var diary: DiaryMemory
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
            HStack {
                Text("하하")
                    .padding()
                Spacer(minLength: 0)
            }
            
            Text("2023/10/26")
                .foregroundColor(.secondary)
                .font(.footnote)
                .padding()
        }
        Image("참 잘했어요")
            .resizable()
            .frame(width: 160, height: 150)
            .rotationEffect(.degrees(-30))
            .padding(.trailing,-200)
        }
    }
}

struct DiaryDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetail()
//            .environmentObject(DiaryStore())
    }
}
