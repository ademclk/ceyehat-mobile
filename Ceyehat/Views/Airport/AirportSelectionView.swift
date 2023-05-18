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
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchTerm)
                .padding(.top)
                .onChange(of: searchTerm) { searchTerm in
                    viewModel.searchAirport(searchTerm: searchTerm.lowercased(with: Locale(identifier: "tr")))
                }
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.airports, id: \.self) { airport in
                    AirportRowView(airport: airport, selectedAirport: $selectedAirport)
                }
                .onAppear {
                    viewModel.getAirports()
                }
            }
        }
        .navigationBarTitle("Select Airport", displayMode: .inline)
    }
}


struct AirportSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let airport = Airport(name: "Test", iataCode: "Test", cityName: "Test", countryName: "Test")
        
        AirportSelectionView(selectedAirport: .constant(airport))
    }
}

