//
//  WelcomeView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import SwiftUI

/// WelcomeView is the first view presented to the user when they launch the app.
///
/// The view contains a greeting message and two buttons that allow the user to
/// navigate to flight booking or check-in sections.
///
/// - Note: The view uses a NavigationView to provide navigation functionality.
/// - SeeAlso: `FlightSearchView`, `CheckInView`
struct WelcomeView: View {
    @State private var isShowingFlightSearch = false
    
    /// The body property defines the visual appearance of the view.
    ///
    /// It consists of the following subviews:
    /// - A greeting text ("Merhaba") and a waving hand image.
    /// - Two buttons for navigation to flight booking and check-in sections.
    ///
    /// - Returns: A ScrollView containing the VStack with the main content.
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    HStack(spacing: 15) {
                        Text("Merhaba")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Image(systemName: "figure.wave")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                    .padding()
                    VStack(spacing: 30) {
                        NavigationLink(destination: FlightSearchView()) {
                            Text("Bilet al")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                        NavigationLink(destination: CheckinView()) {
                            Text("Check-in")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    .padding()
                }
                .navigationTitle("Ceyehat")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
