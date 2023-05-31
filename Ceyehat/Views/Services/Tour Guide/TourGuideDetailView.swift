//
//  TourGuideDetailView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TourGuideDetailView: View {
    var guide: TourGuide
    
    var body: some View {
        VStack {
            Image(guide.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()
            
            Text(guide.name)
                .font(.title)
                .bold()
                .padding(.bottom, 4)
            
            Text(guide.specialization)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text("Deneyim: \(guide.experience) yıl")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(guide.name)
    }
}

struct TourGuideDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let guide = TourGuide(id: 1, name: "", specialization: "", experience: 1, imageName: "", isAvailable: true)
        TourGuideDetailView(guide: guide)
    }
}
