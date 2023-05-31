//
//  TourOrganizerView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TourOrganizerView: View {
    @State private var searchText = ""
    @State private var showOnlyAvailable = false
    
    var filteredTours: [Tour] {
        sampleTours
            .filter { tour in
                (tour.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (showOnlyAvailable ? tour.isAvailable : true)
            }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Tur adı girin...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Toggle(isOn: $showOnlyAvailable) {
                    Text("Sadece mevcut olan turları göster")
                }
                .padding(.horizontal)
                
                List(filteredTours) { tour in
                    NavigationLink(destination: TourDetailView(tour: tour)) {
                        TourRowView(tour: tour)
                    }
                }
            }
            .navigationBarTitle("Tur Organizasyonu", displayMode: .inline)
        }
    }
}

struct TourOrganizerView_Previews: PreviewProvider {
    static var previews: some View {
        TourOrganizerView()
    }
}
