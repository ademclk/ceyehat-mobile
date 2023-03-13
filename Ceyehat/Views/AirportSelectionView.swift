//
//  AirportSelectionView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import SwiftUI

struct AirportSelectionView: View {
    @StateObject var viewModel = AirportViewModel()
    var body: some View {
        NavigationView() {
            List {
                ForEach(viewModel.airports, id: \.self) { airport in
                    HStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.blue)
                            .frame(width: 60, height: 60)
                            .overlay(Text(airport.iataCode)
                                .bold()
                                .foregroundColor(.white))
                        VStack(alignment: .leading) {
                            Text("\(airport.cityName), \(airport.countryName)")
                                .font(.headline)
                            Text("\(airport.name)")
                                .font(.subheadline)
                        }
                        Spacer()
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
        AirportSelectionView()
    }
}
