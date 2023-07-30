//
//  DiaryRow.swift
//  MyDiary
//
//  Created by 이승화 on 2023/07/30.
//

import SwiftUI

struct DiaryRow: View {
//    @ObservedObject var diary: DiaryMemory
    
    var body: some View {
        HStack {
            Image(systemName: "fleuron.fill")
                .foregroundColor(Color("mainColor"))
            VStack(alignment: .leading) {
                Text("haha")
                    .lineLimit(1)
                    .font(.body)
                Text("2023/10/26")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct DiaryRow_Previews: PreviewProvider {
    static var previews: some View {
        DiaryRow()
    }
}
