//
//  PassengerDetailsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 21.03.2023.
//

import SwiftUI

struct PassengerDetailsView: View {
    @Binding var flight: Flight?
    @Binding var price: Double?
    @Binding var passengerCount: Int
    @State private var selectedPassengerType: PassengerType = .adult
    @State private var passengers: [Passenger] = []
    @State var selectedPassenger: Passenger?
    @State private var isPresentingAddPassengerView: Bool = false
    @State private var isPresentingShowPassengerView: Bool = false
    @State private var showAlert = false
    @ObservedObject var viewModel: SeatViewModel
    
    var canAddPassenger: Bool {
        passengers.count < passengerCount
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(flight!.flightNumber) Numaralı Uçuş Bilgisi")
                .font(.headline)
                .padding(.top)
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange)
                .frame(height: 100)
                .overlay {
                    HStack {
                        Text("\(dateSelectionFormatter.string(from: flight!.departureHour))")
                            .font(.largeTitle)
                        
                        VStack{
                            HStack{
                                VStack {
                                    Image(systemName: "airplane.departure")
                                    Text("\(dateFormatter.string(from: flight!.departureHour))")
                                }
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(maxHeight: 25)
                                    .foregroundColor(.white)
                                    .overlay(Text(durationFormatterFull.string(from: flight!.arrivalHour.timeIntervalSince(flight!.departureHour)) ?? ""))
                                
                                VStack {
                                    Image(systemName: "airplane.arrival")
                                    Text("\(dateFormatter.string(from: flight!.arrivalHour))")
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding(.bottom)
            
            Spacer()
            
            Text("Yolcu Listesi")
                .font(.headline)
                .padding(.top)
            
            if passengers.isEmpty {
                Text("")
            } else {
                List {
                    ForEach(passengers, id: \.email) { passenger in
                        PassengerRow(passenger: passenger)
                            .onTapGesture {
                                selectedPassenger = passenger
                                isPresentingShowPassengerView = true
                            }
                    }
                    .onDelete { indexSet in
                        passengers.remove(atOffsets: indexSet)
                    }.environment(\.locale, Locale(identifier: "tr_TR"))
                }
                .sheet(isPresented: $isPresentingShowPassengerView) {
                    ShowPassengerDetailsView(passenger: $selectedPassenger)
                }
            }
            
            VStack {
                Button("Yolcu Ekle") {
                    if passengers.count < passengerCount {
                        isPresentingAddPassengerView = true
                    } else {
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Yolcu sayısı aşıldı."),
                        message: Text("Daha fazla yolcu ekleyemezsiniz."),
                        dismissButton: .default(Text("Tamam"))
                    )
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Spacer()
            
            HStack {
                NavigationLink(destination: AdditionalServicesView(
                    viewModel: viewModel, flight: $flight, passenger: $passengers)) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.red)
                            .overlay(Text("Devam")
                                .font(.headline)
                                .foregroundColor(.white))
                            .frame(maxHeight: 60)
                    }
                    .navigationTitle("Ek Hizmetler")
            }
            .padding()
            
        }
        .padding()
        .navigationTitle("Yolcu Bilgileri")
        .sheet(isPresented: $isPresentingAddPassengerView) {
            AddPassengerView(flight: $flight, selectedPrice: $price, passengers: $passengers) {
                
            }
        }
    }
}

struct PassengerDetailsView_Previews: PreviewProvider {
    @State static var showFlightPriceSheet = false
    @State static var selectedFlight: Flight?
    @State static var selectedPrice: Double?
    @State static var bookings = [Booking(bookingId: "", seatId: "", seatNumber: "", flightId: "", flightNumber: "", currency: "", price: 12.0, passengerType: "")]
    
    @State static var samplePassenger = Passenger(name: "Test", surname: "Test", email: "Test", phoneNumber: "213123", title: "Adult", birthDate: Date(), passengerType: "Adult", bookings: bookings)
    
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
    
    static let price = 100.20
    
    static var previews: some View {
        PassengerDetailsView(flight: .constant(sampleFlight), price: .constant(price), passengerCount: .constant(1), selectedPassenger: samplePassenger, viewModel: SeatViewModel())
    }
}
