//
//  CeyehatApp.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import SwiftUI

@main
struct CeyehatApp: App {
    @StateObject private var userAuth = UserAuth()
    @StateObject private var activityController = ActivityController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(userAuth)
                .environmentObject(activityController)
        }
    }
}
