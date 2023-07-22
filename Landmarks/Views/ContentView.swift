//
//  ContentView.swift
//  Landmarks
//
//  Created by 이승화 on 2023/07/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
