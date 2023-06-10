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
                    HStack {
                        Text("\(airport.iataCode)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel("IATA Code: \(airport.iataCode)")
                        Spacer()
                        Text("\(airport.cityName), \(airport.countryName)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .accessibilityLabel("City and Country: \(airport.cityName), \(airport.countryName)")
                    }
                    Text(airport.name)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                        .accessibilityLabel("Airport Name: \(airport.name)")
                }
                Spacer()
                if selectedAirport == airport {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(selectedAirport == airport ? Color.blue.opacity(0.1) : Color.clear)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedAirport == airport ? Color.blue : Color.clear, lineWidth: 1)
            )
        }
    }
}

struct AirportRowView_Previews: PreviewProvider {
    static var previews: some View {
        let airport = Airport(name: "Test", iataCode: "Test", cityName: "Test", countryName: "Test")
        
        AirportRowView(airport: airport, selectedAirport: .constant(nil))
    }
}
