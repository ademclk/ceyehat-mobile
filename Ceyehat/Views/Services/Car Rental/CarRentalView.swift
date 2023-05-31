//
//  CarRentalView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct CarRentalView: View {
    @State private var searchText = ""
    @State private var showOnlyAvailable = false
    @State private var selectedSegment = 0
    
    var filteredCars: [Car] {
        sampleCars
            .filter { car in
                (car.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (selectedSegment == 0 || car.isAvailable)
            }
            .sorted(by: { $0.pricePerDay < $1.pricePerDay })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Araç adı girin...")
                
                Picker("", selection: $selectedSegment) {
                    Text("Tümü").tag(0)
                    Text("Müsait").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(filteredCars) { car in
                            CarCard(car: car)
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Araç Kiralama", displayMode: .inline)
        }
    }
}

struct CarRentalView_Previews: PreviewProvider {
    static var previews: some View {
        CarRentalView()
    }
}
