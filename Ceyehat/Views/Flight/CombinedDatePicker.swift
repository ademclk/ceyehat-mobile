//
//  CombinedDatePicker.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 17.05.2023.
//

import SwiftUI

struct CombinedDatePicker: View {
    @Binding var departureDate: Date
    @Binding var returnDate: Date
    @Binding var flightType: FlightType
    
    private let turkishLocale = Locale(identifier: "tr_TR")
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Kalkış Tarihi")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                DatePicker("", selection: $departureDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .accentColor(.blue)
                    .foregroundColor(.primary)
                    .environment(\.locale, turkishLocale) // Set Turkish locale
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            
            
            if flightType != .oneWay {
                Spacer()
                
                HStack {
                    Text("Dönüş Tarihi")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("", selection: $returnDate, in: departureDate..., displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .accentColor(.blue)
                        .foregroundColor(.primary)
                        .environment(\.locale, turkishLocale) // Set Turkish locale
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
            }
        }
        .padding(.vertical)
    }
}

struct CombinedDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        let departureDate = Date()
        let returnDate = Calendar.current.date(byAdding: .day, value: 7, to: departureDate)!
        
        CombinedDatePicker(departureDate: .constant(departureDate), returnDate: .constant(returnDate), flightType: .constant(.roundTrip))
            .previewLayout(.sizeThatFits)
            .padding()
            .environment(\.colorScheme, .light)
    }
}
