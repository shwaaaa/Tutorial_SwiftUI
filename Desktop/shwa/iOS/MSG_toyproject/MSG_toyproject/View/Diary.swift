//
//  Diary.swift
//  MSG_toyproject
//
//  Created by 이승화 on 2023/07/24.
//

import SwiftUI

struct Diary: View {
    @State private var diarys = ["2007"]
    @State private var newDiary = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Diary")
                    .font(.system(size: 30, weight: .black))
                    .foregroundColor(Color("diary color"))
                    .padding(.leading)
                    .shadow(color: .green, radius: 20)
                Spacer()
//                Image(systemName: "square.and.pencil")
//                    .resizable()
//                    .frame(width: 25, height: 25)
//                    .bold()
//                    .foregroundColor(Color .gray)
//                    .padding(.trailing)
            }
            TextField("아이템을 입력하세요", text: $newDiary, onCommit: addList)
                .padding(.leading)
            Spacer()
            NavigationView {
                List {
                    ForEach(diarys, id: \.self) { diarys in
                        Text(diarys)
                    }
                    .onDelete(perform: removeList)
                }
            }
        }
    }
    func removeList(at offsets: IndexSet) {
        diarys.remove(atOffsets: offsets)
    }
    
    func addList() {
        self.diarys.insert(self.newDiary, at:0)
        self.newDiary = ""
    }
//    func moveList(from source: IndexSet, to destination: Int) {
//        diarys.move(fromOffsets: source, toOffset: destination)
//    }
}


struct Diary_Previews: PreviewProvider {
    static var previews: some View {
        Diary()
    }
}
