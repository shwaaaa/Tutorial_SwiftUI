//
//  ContentView.swift
//  Weeing_Practice
//
//  Created by 이승화 on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Login")
                .font(
                Font.custom("Nunito", size: 45)
                .weight(.black)
                )
                .foregroundColor(Color(red: 1, green: 0.76, blue: 0.31))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
