//
//  TourGuideView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TourGuideView: View {
    @State private var searchText = ""
    @State private var showOnlyAvailable = false
    
    var filteredTourGuides: [TourGuide] {
        sampleTourGuides
            .filter { guide in
                (guide.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (showOnlyAvailable ? guide.isAvailable : true)
            }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Rehber adı girin...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Toggle(isOn: $showOnlyAvailable) {
                    Text("Sadece müsait rehberleri göster")
                }
                .padding(.horizontal)
                
                List(filteredTourGuides) { guide in
                    NavigationLink(destination: TourGuideDetailView(guide: guide)) {
                        TourGuideRowView(guide: guide)
                    }
                }
            }
            .navigationBarTitle("Rehber", displayMode: .inline)
        }
    }
}

struct TourGuideRowView: View {
    var guide: TourGuide
    
    var body: some View {
        HStack {
            Image(guide.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(guide.name)
                    .font(.headline)
                Text(guide.specialization)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Deneyim: \(guide.experience) yıl")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct TourGuideView_Previews: PreviewProvider {
    static var previews: some View {
        TourGuideView()
    }
}
