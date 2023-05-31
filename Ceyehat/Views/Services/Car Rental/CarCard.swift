//
//  CarCard.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct CarCard: View {
    let car: Car
    
    var body: some View {
        VStack {
            Image(systemName: "car.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack(alignment: .leading) {
                Text(car.name)
                    .font(.headline)
                Text(car.manufacturer)
                    .font(.subheadline)
                Text("\(String(format: "%.2f", car.pricePerDay)) ₺/gün")
                    .font(.subheadline)
                Text(car.isAvailable ? "Müsait" : "Müsait Değil")
                    .font(.subheadline)
                    .foregroundColor(car.isAvailable ? .green : .red)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}
