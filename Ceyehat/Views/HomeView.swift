//
//  HomeView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Int = 0
    @EnvironmentObject var activityController: ActivityController
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView()
                .onAppear { activityController.addActivity(action: "Navigated to WelcomeView", context: activityController.container.viewContext) }
                .onDisappear { activityController.addActivity(action: "Navigated away from WelcomeView", context: activityController.container.viewContext) }
                .tabItem {
                    customTabItem(title: "Ana Sayfa", imageName: selectedTab == 0 ? "house.fill" : "house")
                }
                .tag(0)
            
            ExploreView()
                .onAppear { activityController.addActivity(action: "Navigated to ExploreView", context: activityController.container.viewContext) }
                .onDisappear { activityController.addActivity(action: "Navigated away from ExploreView", context: activityController.container.viewContext) }
                .tabItem {
                    customTabItem(title: "Keşfet", imageName: selectedTab == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
                }
                .tag(1)
            
            ServicesView()
                .onAppear { activityController.addActivity(action: "Navigated to ServicesView", context: activityController.container.viewContext) }
                .onDisappear { activityController.addActivity(action: "Navigated away from ServicesView", context: activityController.container.viewContext) }
                .tabItem {
                    customTabItem(title: "Hizmetler", imageName: selectedTab == 2 ? "globe" : "globe")
                }
                .tag(2)
            
            ProfileView()
                .onAppear { activityController.addActivity(action: "Navigated to ProfileView", context: activityController.container.viewContext) }
                .onDisappear { activityController.addActivity(action: "Navigated away from ProfileView", context: activityController.container.viewContext) }
                .tabItem {
                    customTabItem(title: "Profil", imageName: selectedTab == 3 ? "person.fill" : "person")
                }
                .tag(3)
        }
    }
    
    private func customTabItem(title: String, imageName: String) -> some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let userActivity = ActivityController()
        
        HomeView()
            .environmentObject(userActivity)
    }
}
