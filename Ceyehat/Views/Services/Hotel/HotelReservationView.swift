//
//  HotelReservationView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

enum SortOption: String, CaseIterable {
    case price = "Fiyata Göre"
    case stars = "Yıldıza Göre"
}

struct HotelReservationView: View {
    @State private var searchText = ""
    @State private var selectedLocation = "Tümü"
    @State private var selectedSortOption = SortOption.price
    
    let locations = ["Tümü", "İstanbul", "Ankara", "İzmir", "Antalya", "Bursa"]
    
    var filteredHotels: [Hotel] {
        var filteredHotels = sampleHotels
            .filter { hotel in
                (hotel.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (hotel.location == selectedLocation || selectedLocation == "Tümü")
            }
        
        switch selectedSortOption {
        case .price:
            filteredHotels.sort(by: { $0.price < $1.price })
        case .stars:
            filteredHotels.sort(by: { $0.stars > $1.stars })
        }
        
        return filteredHotels
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Otel adı girin...", text: $searchText)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Picker("Konum", selection: $selectedLocation) {
                        ForEach(locations, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .clipped()
                }
                .padding()
                
                Picker("Sıralama", selection: $selectedSortOption) {
                    ForEach(SortOption.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                List {
                    ForEach(filteredHotels) { hotel in
                        NavigationLink(destination: Text(hotel.name)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(hotel.name)
                                        .font(.headline)
                                    Text(hotel.location)
                                        .font(.subheadline)
                                    HStack {
                                        ForEach(0..<5) { index in
                                            Image(systemName: index < hotel.stars ? "star.fill" : "star")
                                        }
                                    }
                                }
                                Spacer()
                                VStack {
                                    if hotel.isRecommended {
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(.blue)
                                    }
                                    Text("Fiyat: \(String(format: "%.2f", hotel.price)) ₺")
                                        .font(.footnote)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationBarTitle("Otel Rezervasyonu", displayMode: .inline)
        }
    }
}



struct HotelReservationView_Previews: PreviewProvider {
    static var previews: some View {
        HotelReservationView()
    }
}
