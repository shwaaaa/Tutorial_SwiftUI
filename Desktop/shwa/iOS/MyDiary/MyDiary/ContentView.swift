//
//  ContentView.swift
//  MyDiary
//
//  Created by 이승화 on 2023/07/30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isShownFullScreenCover = false
    @EnvironmentObject var store: DiaryStore
//    
    var body: some View {
            NavigationView {
                List {
                    ForEach(0..<10) { diary in
                    NavigationLink {
                        DiaryDetail()
                    } label: {
                        DiaryRow()
                            .padding()
                        }
                    }
                    .frame(width:350,height:70)
                    .background(Color("lettersColor"))
                    .cornerRadius(20)
                }
                
                .listStyle(.plain)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Diary")
                            .font(.system(size: 30, weight: .black))
                            .foregroundColor(Color("mainColor"))
                            .padding(.leading)
                            .shadow(color: .green, radius: 20)
                            .padding(.bottom,30)
            }
                    ToolbarItem {
                        Button {
                            self.isShownFullScreenCover.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .fullScreenCover(isPresented: $isShownFullScreenCover){
                    AddView()
                }
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environmentObject(DiaryStore())
    }
}
