//
//  TaxiCallView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct TaxiCallView: View {
    @State private var searchText = ""
    @State private var showOnlyAvailable = false
    @State private var showAlert = false
    @State private var selectedTaxi: Taxi?
    
    var filteredTaxis: [Taxi] {
        sampleTaxis
            .filter { taxi in
                (taxi.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (showOnlyAvailable ? taxi.isAvailable : true)
            }
            .sorted(by: { $0.ratePerKm < $1.ratePerKm })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Taksi adı girin...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Toggle(isOn: $showOnlyAvailable) {
                    Text("Sadece kullanılabilir taksi göster")
                }
                .padding(.horizontal)
                
                List {
                    ForEach(filteredTaxis) { taxi in
                        VStack(alignment: .leading) {
                            Text(taxi.name)
                                .font(.headline)
                            Text(taxi.location)
                                .font(.subheadline)
                            Text(taxi.isAvailable ? "Kullanılabilir" : "Kullanılamaz")
                                .font(.subheadline)
                            Text("\(String(format: "%.2f", taxi.ratePerKm)) ₺/km")
                                .font(.subheadline)
                        }
                        .padding()
                        .onTapGesture {
                            showAlert = true
                            selectedTaxi = taxi
                        }
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Taksi Arama"),
                        message: Text("\(selectedTaxi?.name ?? "")\nAramak istiyor musunuz?"),
                        primaryButton: .default(Text("Evet"), action: {
                            makePhoneCall(number: selectedTaxi?.name ?? "")
                        }),
                        secondaryButton: .cancel(Text("İptal"))
                    )
                }
            }
            .navigationBarTitle("Taksi Çağırma", displayMode: .inline)
        }
    }
    
    func makePhoneCall(number: String) {
        guard let url = URL(string: "tel:\(number)") else {
            return
        }
        
        UIApplication.shared.open(url)
    }
}



struct TaxiCallView_Previews: PreviewProvider {
    static var previews: some View {
        TaxiCallView()
    }
}
