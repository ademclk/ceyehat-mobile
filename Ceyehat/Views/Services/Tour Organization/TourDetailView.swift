//
//  TourDetailView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TourDetailView: View {
    var tour: Tour
    
    var body: some View {
        VStack {
            Image(tour.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()
            Text(tour.name)
                .font(.title)
                .bold()
                .padding(.bottom, 4)
            
            Text(tour.location)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text(tour.description)
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(tour.name)
    }
}

struct TourDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let tour = Tour(id: 1, name: "", location: "", description: "", imageName: "", isAvailable: true)
        TourDetailView(tour: tour)
    }
}
