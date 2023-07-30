//
//  MyDiaryApp.swift
//  MyDiary
//
//  Created by 이승화 on 2023/07/30.
//

import SwiftUI

@main
struct MyDiaryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
