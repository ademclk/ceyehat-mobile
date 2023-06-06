//
//  BookingRowSectionHeader.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 5.06.2023.
//

import SwiftUI

struct BookingRowSectionHeader: View {
    var flightNumber: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Uçuş Numarası - \(flightNumber)")
                .font(.headline)
                .foregroundColor(.accentColor)
        }
    }
}

struct BookingRowSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        let flightNumber = "AI00001"
        BookingRowSectionHeader(flightNumber: flightNumber)
    }
}
