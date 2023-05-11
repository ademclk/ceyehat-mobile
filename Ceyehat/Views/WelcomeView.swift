//
//  WelcomeView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI
import WeatherKit
import CoreLocation

/// WelcomeView displays options to navigate to the FlightSearchView and CheckinView.
struct WelcomeView: View {
    @StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var weatherKitManager = WeatherKitManager()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    welcomeSection
                    descriptionSection
                    actionButtonsSection
                    specialOffersSection
                    travelTipsSection
                }
                .navigationTitle("Ceyehat")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    private var welcomeSection: some View {
        HStack(spacing: 15) {
            Image(systemName: "figure.wave")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
            Text("Hoş Geldiniz!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
    }
    
    private func fetchWeather() async throws -> Weather {
        let locationService = LocationDataManager()
        let weatherService = WeatherService()
        let location = CLLocation(latitude: locationService.locationManager.location?.coordinate.latitude ?? 0, longitude: locationService.locationManager.location?.coordinate.longitude ?? 0)
        
        return try await weatherService.weather(for: location)
    }
    
    private var descriptionSection: some View {
        VStack {
            if locationDataManager.authorizationStatus == .authorizedWhenInUse {
                 Label(weatherKitManager.temp, systemImage: weatherKitManager.symbol)
                    .task {
                        await weatherKitManager.getWeather(latitude: locationDataManager.latitude, longitude: locationDataManager.longitude)
                    }
            } else {
                Text("Konum bilgisi yok.")
            }
        }
    }

    
    private var actionButtonsSection: some View {
        VStack(spacing: 30) {
            NavigationLink(destination: FlightSearchView()) {
                HStack {
                    Image(systemName: "airplane")
                        .foregroundColor(.white)
                        .padding(.trailing)
                    Text("Bilet al")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(.horizontal)
            
            NavigationLink(destination: CheckinView()) {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.white)
                        .padding(.trailing)
                    Text("Check-in")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
    }
}

private var specialOffersSection: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Özel Teklifler ve Promosyonlar")
            .font(.headline)
            .padding(.horizontal)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(specialOffers, id: \.self) { offer in
                    VStack {
                        Image(systemName: offer.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .cornerRadius(10)
                        Text(offer.title)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

private var travelTipsSection: some View {
    VStack(alignment: .leading, spacing: 10) {
        Text("Seyahat İpuçları ve Haberler")
            .font(.headline)
            .padding(.horizontal)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(sampleTravelTips) { tip in
                    VStack {
                        Image(systemName: tip.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .cornerRadius(10)
                        Text(tip.title)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
