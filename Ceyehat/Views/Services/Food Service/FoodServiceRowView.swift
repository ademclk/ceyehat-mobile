//
//  FoodServiceRowView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct FoodServiceRowView: View {
    var service: FoodService
    
    var body: some View {
        HStack {
            Image(service.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(service.name)
                    .font(.headline)
                Text(service.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Teslim Süresi: \(service.deliveryTime) dk")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Puan: \(String(format: "%.1f", service.rating))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}


struct FoodServiceRowView_Previews: PreviewProvider {
    static var previews: some View {
        let foodservice = FoodService(id: 1, name: "", cuisine: "", deliveryTime: 1, rating: 2.3, imageName: "", isAvailable: true)
        FoodServiceDetailView(service: foodservice)
    }
}
