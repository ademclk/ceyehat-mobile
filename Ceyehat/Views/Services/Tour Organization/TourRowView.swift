//
//  TourRowView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TourRowView: View {
    var tour: Tour
    
    var body: some View {
        HStack {
            Image(tour.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(tour.name)
                    .font(.headline)
                Text(tour.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(tour.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct TourRowView_Previews: PreviewProvider {
    static var previews: some View {
        let tour = Tour(id: 1, name: "", location: "", description: "", imageName: "", isAvailable: true)
        TourRowView(tour: tour)
    }
}
