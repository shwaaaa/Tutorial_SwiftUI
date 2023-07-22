//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 이승화 on 2023/07/22.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
