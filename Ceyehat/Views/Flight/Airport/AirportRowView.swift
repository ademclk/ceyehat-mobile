//
//  AirportRowView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import SwiftUI

/// A custom view that represents a single airport row in the airport list.
///
/// - Parameters:
///   - airport: The airport object containing the airport details.
///   - selectedAirport: A binding to the currently selected airport in the parent view.
struct AirportRowView: View {
    let airport: Airport
    let selectedAirport: Airport?
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(selectedAirport == airport ? Color.blue : Color.gray)
                .frame(width: 60, height: 60)
                .overlay(Text(airport.iataCode)
                    .bold()
                    .foregroundColor(.white))
            
            VStack(alignment: .leading) {
                Text("\(airport.cityName), \(airport.countryName)")
                    .font(.headline)
                    .foregroundColor(selectedAirport == airport ? Color.blue : Color.primary)
                Text("\(airport.name)")
                    .font(.subheadline)
                    .foregroundColor(selectedAirport == airport ? Color.blue : Color.primary)
            }
            
            Spacer()
            
            if selectedAirport == airport {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.blue)
            }
        }
        .padding(.vertical, 8)
    }
}

struct AirportRow_Previews: PreviewProvider {
    static var previews: some View {
        let airport = Airport(name: "Test Airport", iataCode: "TST", cityName: "Test City", countryName: "Test Country")
        
        let selectedAirport = Airport(name: "Selected Airport", iataCode: "SEL", cityName: "Selected City", countryName: "Selected Country")
        
        VStack {
            AirportRowView(airport: airport, selectedAirport: nil)
                .previewLayout(.sizeThatFits)
                .padding()
            
            AirportRowView(airport: selectedAirport, selectedAirport: selectedAirport)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
