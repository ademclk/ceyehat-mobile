//
//  FlightLegRowFooter.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 4.06.2023.
//

import SwiftUI

struct FlightLegRowFooter: View {
    var id: String
    var status: String
    var price: Double
    var currency: String
    var seatNumber: String?
    
    var body: some View {
        VStack {
            Text("Fiyat: \(price, specifier: "%.2f") \(currency)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            Text("Koltuk Numarası: \(seatNumber ?? "??")")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Spacer()
            Text("\(id)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}


struct FlightLegRowFooter_Previews: PreviewProvider {
    static var previews: some View {
        FlightLegRowFooter(id: "21312-211-32231-123-1231", status: "ACTIVE", price: 120.3, currency: "TRY", seatNumber: "1A")
    }
}
