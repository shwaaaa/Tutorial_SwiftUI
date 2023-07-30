//
//  AddView.swift
//  MyDiary
//
//  Created by 이승화 on 2023/07/30.
//

import SwiftUI

struct AddView: View {
    @State var newdiary: String = ""
    @Environment(\.dismiss) private var dismiss
//    @EnvironmentObject var store: DiaryStore
//    var diary: DiaryStore? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $newdiary)
                    .padding(.leading)
                    .padding(.top)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("New Diary")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(Color("mainColor"))
                        .shadow(color: .green, radius: 20)
                }
                ToolbarItemGroup {
                    Button {    
                        dismiss()
                    } label: {
                        Text("등록")
                    }
                }
                ToolbarItemGroup {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.square.fill")
                            .padding(.leading)
                            .foregroundColor(.red)
                    }

                    
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
//            .environmentObject(DiaryStore())
    }
}
