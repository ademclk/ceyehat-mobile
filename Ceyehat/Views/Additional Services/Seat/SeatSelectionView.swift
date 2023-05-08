//
//  SeatSelectionView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 22.03.2023.
//

import SwiftUI

struct SeatSelectionView: View {
    @ObservedObject var viewModel: SeatViewModel
    
    @Binding var flight: Flight?
    @Binding var passengers: [Passenger]
    
    @State private var selectedSeat: Seat?
    @State private var currentPassengerIndex: Int = 0
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange)
                .frame(height: 70)
                .overlay {
                    HStack(spacing: 15) {
                        Text("\(dateSelectionFormatter.string(from: flight!.departureHour))")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        VStack(alignment: .center, spacing: 10){
                            HStack(alignment: .center, spacing: 15){
                                VStack {
                                    Image(systemName: "airplane.departure.fill")
                                    Text("\(dateFormatter.string(from: flight!.departureHour))")
                                }
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(maxHeight: 25)
                                    .foregroundColor(.white)
                                    .overlay(Text(durationFormatterFull.string(from: flight!.arrivalHour.timeIntervalSince(flight!.departureHour)) ?? ""))
                                
                                VStack {
                                    Image(systemName: "airplane.arrival.fill")
                                    Text("\(dateFormatter.string(from: flight!.arrivalHour))")
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding(.horizontal)
            
            TabView {
                ForEach(passengers, id: \.email) { passenger in
                    HStack {
                        PassengerRow(passenger: passenger)
                        Spacer()
                        Text("\(passenger.selectedSeat ?? "")")
                    }
                    .padding(.horizontal)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(maxHeight: 120)
            
            ScrollView {
                SeatGridView(seats: viewModel.seats.filter { $0.seatClass == viewModel.selectedSeatType.rawValue }) { seat in
                    selectedSeat = seat
                    showAlert = true
                }
            }
            .padding(.horizontal)
            .frame(maxHeight: .greatestFiniteMagnitude)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Koltuk Bilgisi"),
                      message: Text(selectedSeat?.seatNumber ?? ""),
                      primaryButton: .default(Text("Onayla"), action: {
                    passengers[currentPassengerIndex].selectedSeat = selectedSeat?.seatNumber
                }),
                      secondaryButton: .default(Text("İptal et")))
            }
        }
        .onAppear {
            viewModel.searchSeat(flightNumber: flight!.flightNumber, aircraftName: flight!.aircraftName)
        }
    }
}


struct SeatSelectionView_Previews: PreviewProvider {
    static let sampleFlight = Flight(
        flightNumber: "AB123",
        airlineName: "Air Berlin",
        aircraftName: "Boeing 737",
        departureHour: Date(),
        arrivalHour: Date().addingTimeInterval(3600),
        economyPrice: 400.0,
        comfortPrice: 700.0,
        businessPrice: 1200.0
    )
    static let bookings = [Booking(flightId: "334", price: 123.00, currency: "TRY", passengerType: "0")]
    
    static let passenger = Passenger(name: "TEST1", surname: "", email: "a", phoneNumber: "", title: "", birthDate: Date(), passengerType: "", bookings: bookings)
    static let passenger2 = Passenger(name: "TEST2", surname: "", email: "b", phoneNumber: "", title: "", birthDate: Date(), passengerType: "", bookings: bookings)
    static let passenger3 = Passenger(name: "TEST3", surname: "", email: "c", phoneNumber: "", title: "", birthDate: Date(), passengerType: "", bookings: bookings)
    
    static let passengers = [passenger, passenger2, passenger3]
    
    static var previews: some View {
        SeatSelectionView(viewModel: SeatViewModel(), flight: .constant(sampleFlight), passengers: .constant(passengers))
    }
}
