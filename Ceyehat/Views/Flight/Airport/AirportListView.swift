//
//  AirportListView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import SwiftUI

/// A custom view that represents a list of airports.
///
/// - Parameters:
///   - airports: An array of Airport objects to display in the list.
///   - selectedAirport: A binding to the currently selected airport in the parent view.
struct AirportListView: View {
    let airports: [Airport]
    @Binding var selectedAirport: Airport?
    
    var body: some View {
        List {
            Section(header: Text("Airports")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 8)
                .padding(.bottom, 4)) {
                    ForEach(airports, id: \.self) { airport in
                        Button(action: {
                            selectedAirport = airport
                        }) {
                            AirportRowView(airport: airport, selectedAirport: selectedAirport)
                        }
                    }
                }
        }
        .listStyle(.plain)
    }
}


struct AirportListView_Previews: PreviewProvider {
    static var previews: some View {
        let airport1 = Airport(name: "Test Airport", iataCode: "TST", cityName: "Test City", countryName: "Test Country")
        
        let airport2 = Airport(name: "Another Airport", iataCode: "ANR", cityName: "Another City", countryName: "Another Country")
        
        let selectedAirport = State<Airport?>(initialValue: airport1)
        
        AirportListView(airports: [airport1, airport2], selectedAirport: selectedAirport.projectedValue)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
