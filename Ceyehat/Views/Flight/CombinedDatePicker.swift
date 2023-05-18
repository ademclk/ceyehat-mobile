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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Kalkış Tarihi")
                    .font(.caption)
                    .foregroundColor(.gray)
                DatePicker("Departure date", selection: $departureDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .accentColor(.blue)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            
            if flightType != .oneWay {
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Dönüş Tarihi")
                        .font(.caption)
                        .foregroundColor(.gray)
                    DatePicker("Return date", selection: $returnDate, in: departureDate..., displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .accentColor(.blue)
                }
                .padding()
                .background(Color.white)
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
    }
}
