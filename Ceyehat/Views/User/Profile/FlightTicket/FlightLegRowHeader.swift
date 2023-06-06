//
//  FlightLegRowHeader.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 4.06.2023.
//

import SwiftUI

struct FlightLegRowHeader: View {
    var title: String
    var airportCode: String
    var airportName: String
    var date: String
    var hour: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.secondary)
            
            VStack(alignment: .leading) {
                Text(airportCode)
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .bold()
                VStack(alignment: .leading) {
                    Text(date)
                    Text(hour)
                }
            }
        }
    }
}


struct FlightLegRowHeader_Previews: PreviewProvider {
    static var previews: some View {
        FlightLegRowHeader(title: "TEST", airportCode: "ESB", airportName: "ANKARA ESENBOĞA HAVALİMANI", date: "24", hour: "12.30")
    }
}
