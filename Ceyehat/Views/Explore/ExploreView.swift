//
//  ExploreView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 26.04.2023.
//

import SwiftUI
import MapKit

struct ExploreView: View {
    @State private var showingCityMap = false
    @State private var selectedCity: FeaturedCity?
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Öne Çıkan Şehirler").font(.headline)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(sampleFeaturedCities) { city in
                                cityCard(city: city)
                                    .onTapGesture {
                                        selectedCity = city
                                        showingCityMap.toggle()
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
                Section(header: Text("En İyi Turistik Yerler").font(.headline)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(sampleTopAttractions) { attraction in
                                attractionCard(attraction: attraction)
                            }
                        }
                        .padding()
                    }
                }
                
                Section(header: Text("Önerilen Gezi Programları").font(.headline)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(sampleRecommendedItineraries) { itinerary in
                                itineraryCard(itinerary: itinerary)
                            }
                        }
                        .padding()
                    }
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Keşfet")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                }
            }
            .overlay(
                Group {
                    if showingCityMap {
                        CityMapModalView(city: selectedCity, showingCityMap: $showingCityMap)
                    }
                }
            )
        }
    }
    
    
    private func cityCard(city: FeaturedCity) -> some View {
        VStack {
            ZStack {
                CityMapView(coordinate: city.coordinate)
                    .frame(width: 180, height: 180)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.1), lineWidth: 1)
                    )
                
                Color.clear
                    .frame(width: 180, height: 180)
                    .cornerRadius(10)
            }
            .onTapGesture {
                selectedCity = city
                showingCityMap.toggle()
            }
            
            Text(city.name)
                .fontWeight(.semibold)
        }
    }
    
    private var topAttractionsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("En İyi Gezilecek Yerler")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(sampleTopAttractions) { attraction in
                        attractionCard(attraction: attraction)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var recommendedItinerariesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Önerilen Gezi Programları")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(sampleRecommendedItineraries) { itinerary in
                        itineraryCard(itinerary: itinerary)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var categoriesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Kategoriler")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(sampleCategories) { category in
                        categoryCard(category: category)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
