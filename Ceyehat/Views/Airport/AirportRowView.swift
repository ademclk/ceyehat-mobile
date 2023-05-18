//
//  AirportRowView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 15.05.2023.
//

import SwiftUI

struct AirportRowView: View {
    var airport: Airport
    @Binding var selectedAirport: Airport?
    
    var body: some View {
        Button(action: {
            selectedAirport = airport
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(airport.iataCode)")
                        .font(.headline)
                        .accessibilityLabel("IATA Code: \(airport.iataCode)")
                    
                    Text("\(airport.cityName), \(airport.countryName)")
                        .accessibilityLabel("City and Country: \(airport.cityName), \(airport.countryName)")
                        .font(.callout)
                        .foregroundColor(.primary)
                    
                    Text(airport.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .accessibilityLabel("Airport Name: \(airport.name)")
                }
                Spacer()
                if selectedAirport == airport {
                    Image(systemName: "")
                        .foregroundColor(.blue)
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .padding()
        .background(selectedAirport == airport ? Color.blue.opacity(0.1) : Color.clear)
        .cornerRadius(10)
    }
}



struct AirportRowView_Previews: PreviewProvider {
    static var previews: some View {
        let airport = Airport(name: "Test", iataCode: "Test", cityName: "Test", countryName: "Test")
        
        AirportSelectionView(selectedAirport: .constant(airport))
    }
}
