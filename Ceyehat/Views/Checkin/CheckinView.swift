//
//  CheckinView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 5.04.2023.
//

import SwiftUI

struct CheckinView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text("Check-In")
                .font(.largeTitle)
                .fontWeight(.bold)
                    
            VStack {
                TextField("Bilet numarası ya da rezervasyon kodu", text: $text)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                TextField("Adı", text: $text)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                TextField("Soyadı", text: $text)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                VStack{
                    
                    Button(action: {}) {
                        Text("Devam et")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "exclamationmark.circle.fill")
                            Text("Ad ve soyad bilgisi kimlikte yazıldığı gibi olmalıdır.")
                        }
                        
                        HStack {
                            Image(systemName: "exclamationmark.circle.fill")
                            Text("Rezervasyon kodu biletiniz ile gönderilen 6 haneli koddur.")
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Text("Hesabınız ile devam ederek check-in işleminizi daha kolay gerçekleştirebilirsiniz.")
                    }
                    
                    Button(action: {}) {
                        Text("Hesabım ile devam et")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.secondary)
                            .cornerRadius(10)
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct CheckinView_Previews: PreviewProvider {
    static var previews: some View {
        CheckinView()
    }
}
