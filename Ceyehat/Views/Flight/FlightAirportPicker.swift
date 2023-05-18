//
//  FlightAirportPicker.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 17.05.2023.
//

import SwiftUI

struct FlightAirportPicker: View {
    @Binding var departure: Airport?
    @Binding var arrival: Airport?
    @Binding var isSelectingDeparture: Bool
    @Binding var isSelectingArrival: Bool
    @Binding var flightType: FlightType
    
    var body: some View {
        HStack(alignment: .center) {
            OriginAirportButton(origin: departure) {
                isSelectingDeparture = true
            }
            Spacer()
            FlightTypeIcon(flightType: flightType)
            Spacer()
            DestinationAirportButton(destination: arrival) {
                isSelectingArrival = true
            }
        }
    }
}

private struct OriginAirportButton: View {
    var origin: Airport?
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading) {
                Text("Kalkış")
                    .font(.caption)
                Text(origin?.iataCode ?? "Nereden?")
                    .font(origin != nil ? .title : nil)
                    .fontWeight(origin != nil ? .bold : nil)
                    .foregroundColor(origin != nil ? .primary : .secondary)
            }
        }
        .buttonStyle(.plain)
    }
}

private struct DestinationAirportButton: View {
    var destination: Airport?
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .trailing) {
                Text("Varış")
                    .font(.caption)
                Text(destination?.iataCode ?? "Nereye?")
                    .font(destination != nil ? .title : nil)
                    .fontWeight(destination != nil ? .bold : nil)
                    .foregroundColor(destination != nil ? .primary : .secondary)
            }
        }
        .buttonStyle(.plain)
    }
}

private struct FlightTypeIcon: View {
    var flightType: FlightType
    
    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: 44, height: 44)
            .padding()
            .overlay {
                Image(systemName: flightType.systemImage)
                    .foregroundStyle(.background)
            }
    }
}

struct FlightAirportPicker_Previews: PreviewProvider {
    static var previews: some View {
        let departure = Airport(name: "Test Departure", iataCode: "nil", cityName: "Test City", countryName: "Test Country")
        let arrival = Airport(name: "Test Arrival", iataCode: "TAR", cityName: "Test City", countryName: "Test Country")
        
        FlightAirportPicker(departure: .constant(departure), arrival: .constant(arrival), isSelectingDeparture: .constant(false), isSelectingArrival: .constant(false), flightType: .constant(.roundTrip))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
