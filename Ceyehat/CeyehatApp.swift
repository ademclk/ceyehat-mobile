//
//  CeyehatApp.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import SwiftUI

@main
struct CeyehatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
