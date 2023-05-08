//
//  AirportSelectionView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import SwiftUI

struct AirportSelectionView: View {
    @StateObject var viewModel = AirportViewModel()
    @Binding var selectedAirport: Airport?
    
    @State private var isLoading: Bool = false
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchTextFieldView(searchTerm: $searchTerm, viewModel: viewModel)
                
                if isLoading {
                    ProgressView()
                } else {
                    AirportListView(airports: viewModel.airports, selectedAirport: $selectedAirport)
                }
            }
            .onAppear {
                fetchAirports()
            }
        }
    }
    
    private func fetchAirports() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            viewModel.getAirports()
            isLoading = false
        }
    }
}


struct AirportSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let airport = Airport(name: "Test", iataCode: "Test", cityName: "Test", countryName: "Test")
        
        AirportSelectionView(selectedAirport: .constant(airport))
    }
}
