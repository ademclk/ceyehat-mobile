//
//  AddPassengerView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 21.03.2023.
//

import SwiftUI

struct AddPassengerView: View {
    @ObservedObject var viewModel = PassengerViewModel()
    @Environment(\.presentationMode) private var presentationMode
    @Binding var flight: Flight?
    @Binding var selectedPrice: Double?
    @Binding var passengers: [Passenger]
    let saveAction: () -> Void
    
    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var birthDate = Date()
    @State private var selectedPassengerType: PassengerType = .adult
    @State private var title: PassengerTitle = .mr
    @State private var isShowingLoadingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    TextField("Adı", text: $name)
                    TextField("Soyadı", text: $surname)
                    TextField("E-posta Adresi", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    TextField("Telefon Numarası", text: $phoneNumber)
                    DatePicker("Doğum Tarihi", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                        .environment(\.locale, Locale(identifier: "tr_TR"))
                }
                
                Section(header: Text("")) {
                    Picker(selection: $title, label: Text("Unvan")) {
                        ForEach(PassengerTitle.allCases, id: \.self) { title in
                            Text(title.description).tag(title)
                        }
                    }
                }
                
                Section(header: Text("")) {
                    Picker("Passenger Type", selection: $selectedPassengerType) {
                        ForEach(PassengerType.allCases, id: \.self) { type in
                            Text(type.description)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Button("Kaydet") {
                        savePassenger()
                    }
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .greatestFiniteMagnitude)
                    .cornerRadius(10)
                }
            }
            .navigationBarTitle("Yolcu Bilgileri")
            .overlay(
                ZStack {
                    if isShowingLoadingAlert {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            LoadingAlertView()
                        }
                        .frame(width: 200, height: 100)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
            )
        }
    }
    
    private func savePassenger() {
        let bookings = [Booking(seatId: "", flightId: flight?.flightNumber ?? "", price: selectedPrice ?? 0, currency: "TRY", passengerType: selectedPassengerType.description)]
        
        let passenger = Passenger(
            name: name,
            surname: surname,
            email: email,
            phoneNumber: phoneNumber,
            title: title.description,
            birthDate: birthDate,
            passengerType: selectedPassengerType.description,
            userId: nil,
            bookings: bookings
        )
        
        isShowingLoadingAlert = true
        
        viewModel.sendPassengerToServer(passenger: passenger) { [self] _ in
            isShowingLoadingAlert = false
            passengers.append(passenger)
            saveAction()
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddPassengerView_Previews: PreviewProvider {
    static var previews: some View {
        let bookings = [Booking(flightId: "334", price: 123.00, currency: "TRY", passengerType: "0")]
        
        let passengers = [Passenger(name: "", surname: "", email: "", phoneNumber: "", title: "", birthDate: Date(), passengerType: "", bookings: bookings)]
        
        let sampleFlight = Flight(
            flightNumber: "AB123",
            airlineName: "Air Berlin",
            aircraftName: "Boeing 737",
            departureHour: Date(),
            arrivalHour: Date().addingTimeInterval(3600),
            economyPrice: 400.0,
            comfortPrice: 700.0,
            businessPrice: 1200.0
        )
        
        let price = 100.20
        
        AddPassengerView(flight: .constant(sampleFlight), selectedPrice: .constant(price), passengers: .constant(passengers), saveAction: {})
    }
}
