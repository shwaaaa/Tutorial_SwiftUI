//
//  ContentView.swift
//  github_practice
//
//  Created by 이승화 on 2023/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack { Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!") .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
