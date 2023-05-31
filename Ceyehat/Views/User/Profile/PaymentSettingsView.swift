//
//  PaymentSettingsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 24.05.2023.
//

import SwiftUI
import Security

struct PaymentSettingsView: View {
    @State private var cardNumber = ""
    @State private var cardExpiration = ""
    @State private var cardCVV = ""
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Kart Bilgisi")) {
                    SecureField("Kart Numarası", text: $cardNumber)
                        .keyboardType(.numberPad)
                    
                    HStack {
                        TextField("Tarih (MM/YY)", text: $cardExpiration)
                            .keyboardType(.numberPad)
                        
                        TextField("CVV", text: $cardCVV)
                            .keyboardType(.numberPad)
                    }
                }
                .textCase(.none)
                
                Section {
                    Button(action: saveCardInformation) {
                        Text("Kart bilgisini kaydet")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .textCase(.none)
            }
        }
        .padding()
        .navigationTitle("Ödeme")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func saveCardInformation() {
        guard let cardData = "\(cardNumber)\n\(cardExpiration)\n\(cardCVV)".data(using: .utf8) else {
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.ceyehat.payment",
            kSecAttrAccount as String: "card",
            kSecValueData as String: cardData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecSuccess {
            print("Card information saved successfully")
        } else if status == errSecDuplicateItem {
            print("Card information already exists")
        } else {
            print("Error saving card information: \(status)")
        }
    }
}


struct PaymentSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSettingsView()
    }
}
