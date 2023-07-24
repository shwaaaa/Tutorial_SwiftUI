//
//  MSG_toyprojectApp.swift
//  MSG_toyproject
//
//  Created by 이승화 on 2023/07/20.
//

import SwiftUI

@main
struct MSG_toyprojectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
