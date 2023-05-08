//
//  HomeView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import SwiftUI

/// HomeView is the main view of the app containing a TabView with four tabs: WelcomeView, ExploreView, ServicesView, and ProfileView.
struct HomeView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView()
                .tabItem {
                    customTabItem(title: "Ana Sayfa", imageName: selectedTab == 0 ? "house.fill" : "house")
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    customTabItem(title: "Keşfet", imageName: selectedTab == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
                }
                .tag(1)
            
            ServicesView()
                .tabItem {
                    customTabItem(title: "Hizmetler", imageName: selectedTab == 2 ? "globe" : "globe")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    customTabItem(title: "Profil", imageName: selectedTab == 3 ? "person.fill" : "person")
                }
                .tag(3)
        }
    }
    
    /// Creates a custom tab item with a title and an image.
    /// - Parameters:
    ///   - title: The title of the tab item.
    ///   - imageName: The name of the system image for the tab item.
    /// - Returns: A custom HStack with an image and text.
    private func customTabItem(title: String, imageName: String) -> some View {
        HStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
