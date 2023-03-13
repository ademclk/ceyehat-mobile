//
//  AirportSelectionView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI

struct AirportSelectionView: View {
    @StateObject var viewModel = AirportViewModel()
    @Binding var selectedAirport: Airport?
    
    var body: some View {
        NavigationView() {
            List {
                ForEach(viewModel.airports, id: \.self) { airport in
                    Button(action: {
                        selectedAirport = airport
                    }) {
                        HStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(selectedAirport == airport ? Color.red : Color.blue)
                                .frame(width: 60, height: 60)
                                .overlay(Text(airport.iataCode)
                                    .bold()
                                    .foregroundColor(.white))
                            VStack(alignment: .leading) {
                                Text("\(airport.cityName), \(airport.countryName)")
                                    .font(.headline)
                                    .foregroundColor(selectedAirport == airport ? Color.red : Color.primary)
                                Text("\(airport.name)")
                                    .font(.subheadline)
                                    .foregroundColor(selectedAirport == airport ? Color.red : Color.primary)
                            }
                            Spacer()
                            if selectedAirport == airport {
                                Image(systemName: "checkmark")
                                    .foregroundColor(selectedAirport == airport ? Color.red : Color.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Airports")
            .onAppear {
                viewModel.getAirports()
            }
        }
    }
}


struct AirportSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let airport = Airport(name: "Test", iataCode: "Test", cityName: "Test", countryName: "Test")
        
        AirportSelectionView(selectedAirport: .constant(airport))
    }
}
