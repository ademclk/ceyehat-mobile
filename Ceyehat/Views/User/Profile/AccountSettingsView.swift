//
//  AccountSettingsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 24.05.2023.
//

import SwiftUI

struct AccountSettingsView: View {
    @EnvironmentObject var userAuth: UserAuth
    @State private var passportNumber = ""
    @State private var nationalIDNumber = ""
    
    var body: some View {
        List {
            Section(header: Text("Hesap Kimlikleri")) {
                if let userId = userAuth.user?.id {
                    Text("Kullanıcı Kimliği: \(userId)")
                } else {
                    Text("Kullanıcı kimliğine ulaşılamıyor.")
                }
                
                if let customerId = userAuth.user?.customerId {
                    Text("Müşteri Kimliği: \(customerId)")
                } else {
                    Text("Müşteri kimliğine ulaşılamıyor.")
                }
            }
            .textCase(.none)
            
            Section(header: Text("Hesap Bilgileri")) {
                if let firstName = userAuth.user?.firstName {
                    Text("Ad: \(firstName)")
                } else {
                    Text("Ad bilgisine ulaşılamıyor.")
                }
                
                if let lastName = userAuth.user?.lastName {
                    Text("Soyad: \(lastName)")
                } else {
                    Text("Soyad bilgisine ulaşılamıyor.")
                }
            }
            .textCase(.none)
            
            Section(header: Text("Kişisel Bilgiler")) {
                TextField("Pasaport Numarası", text: $passportNumber)
                    .keyboardType(.numbersAndPunctuation)
                TextField("TC Kimlik Numarası", text: $nationalIDNumber)
                    .keyboardType(.numbersAndPunctuation)
            }
            .textCase(.none)
        }
        .navigationTitle("Hesap Ayarları")
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
