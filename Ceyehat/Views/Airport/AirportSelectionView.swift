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
    
    @State private var isLoading: Bool = false
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationView() {
            VStack {
                VStack {
                    VStack {
                        SearchBarView(searchText: $searchTerm)
                            .onChange(of: searchTerm) { searchTerm in
                                viewModel.searchAirport(searchTerm: searchTerm.lowercased(with: Locale(identifier: "tr")))
                            }
                    }
                    if isLoading {
                        ProgressView()
                    }
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
                    .onAppear {
                        isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            viewModel.getAirports()
                            isLoading = false
                        }
                }
                }
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
