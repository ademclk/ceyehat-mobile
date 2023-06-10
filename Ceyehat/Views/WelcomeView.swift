//
//  WelcomeView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI
import UIKit
import WeatherKit
import CoreLocation

/// WelcomeView displays options to navigate to the FlightSearchView and CheckinView.
struct WelcomeView: View {
    @EnvironmentObject var userAuth: UserAuth
    @StateObject var locationDataManager = LocationDataManager()
    @StateObject var weatherKitManager = WeatherKitManager()
    @State private var currentOfferIndex = 0
    @State private var currentTipIndex = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    private var userName: String {
        userAuth.user?.firstName ?? "Kullanıcı"
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    welcomeSection
                    descriptionSection
                    specialOffersSection
                    actionButtonsSection
                    travelTipsSection
                }
                .navigationTitle("Ceyehat")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    // MARK: - Welcome Section
    
    private var welcomeSection: some View {
        HStack(spacing: 15) {
            Text("Hoş Geldin, \(userName)!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
    }
    
    
    // MARK: - Description Section
    
    private var descriptionSection: some View {
        VStack {
            if locationDataManager.authorizationStatus == .authorizedWhenInUse {
                if weatherKitManager.weather != nil {
                    Label(weatherKitManager.temp, systemImage: weatherKitManager.symbol)
                        .font(.title)
                        .bold()
                } else {
                    Text("Yükleniyor...")
                        .onAppear {
                            if weatherKitManager.weather == nil {
                                Task {
                                    await weatherKitManager.getWeather(latitude: locationDataManager.latitude, longitude: locationDataManager.longitude)
                                }
                            }
                        }
                }
            } else {
                Text("Konum bilgisine erişilemiyor.")
            }
        }
    }
    
    // MARK: - Action Buttons Section
    
    private var actionButtonsSection: some View {
        VStack(spacing: 30) {
            ActionButtonView(
                destination: FlightSearchView(),
                icon: "airplane",
                title: "Bilet al",
                actionString: "Navigated to FlightSearchView"
            )
            .environmentObject(userAuth)
            
            ActionButtonView(
                destination: CheckinView(),
                icon: "checkmark.circle",
                title: "Check-in",
                actionString: "Navigated to CheckinView"
            )
            .environmentObject(userAuth)
        }
        .padding(.bottom)
    }
    
    // MARK: - Special Offers Section
    
    private var specialOffersSection: some View {
        VStack(alignment: .center, spacing: 10) {
            TabView(selection: $currentOfferIndex) {
                ForEach(specialOffers.indices, id: \.self) { index in
                    let offer = specialOffers[index]
                    ZStack{
                        Text(offer.title)
                            .zIndex(1)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(offer.color))
                            .frame(width: 360, height: 200)
                            .zIndex(0)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(height: 250)
            .onReceive(timer) { _ in
                let newIndex = (currentOfferIndex + 1) % specialOffers.count
                withAnimation(.easeInOut(duration: 3)) {
                    currentOfferIndex = newIndex
                }
            }
        }
    }
    
    // MARK: - Travel Tips Section
    
    private var travelTipsSection: some View {
        TabView(selection: $currentTipIndex) {
            ForEach(sampleTravelTips.indices, id: \.self) { index in
                let tip = sampleTravelTips[index]
                ZStack {
                    VStack {
                        Text(tip.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                            .padding()
                        Image(systemName: tip.image)
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                    .zIndex(1)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                        .frame(width: 360, height: 200)
                        .zIndex(0)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .frame(height: 250)
        .padding(.horizontal)
        .onReceive(timer) { _ in
            let newIndex = (currentTipIndex + 1) % sampleTravelTips.count
            withAnimation(.easeInOut(duration: 3)) {
                currentTipIndex = newIndex
            }
        }
    }

}

// MARK: - Preview

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let userAuth = UserAuth()
        
        return WelcomeView()
            .environmentObject(userAuth)
    }
}
