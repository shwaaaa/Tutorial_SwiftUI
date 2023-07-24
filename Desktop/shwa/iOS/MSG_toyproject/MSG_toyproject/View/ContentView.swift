//
//  ContentView.swift
//  MSG_toyproject
//
//  Created by 이승화 on 2023/07/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        HStack {
            TabView {
                Todo()
                    .tabItem{
                        VStack {
                            Image(systemName: "checkmark")
                            Text("To do")
                        }
                    }
                Diary()
                    .tabItem{
                        VStack {
                            Image(systemName: "book.fill")
                            Text("Diary")
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
