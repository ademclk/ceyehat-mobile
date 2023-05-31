//
//  FoodServiceDetailView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct FoodServiceDetailView: View {
    var service: FoodService
    
    var body: some View {
        VStack {
            Image(service.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .padding()
            
            Text(service.name)
                .font(.title)
                .bold()
                .padding(.bottom, 4)
            
            Text(service.cuisine)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text("Teslim Süresi: \(service.deliveryTime) dk")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text("Puan: \(String(format: "%.1f", service.rating))")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(service.name)
    }
}

struct FoodServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let foodservice = FoodService(id: 1, name: "", cuisine: "", deliveryTime: 1, rating: 2.3, imageName: "", isAvailable: true)
        FoodServiceDetailView(service: foodservice)
    }
}
