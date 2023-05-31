//
//  RegisterView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 27.04.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewModel()
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hesap Oluştur")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    Text("Ad")
                        .font(.headline)
                    TextField("Adınız", text: $registerViewModel.firstName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    Text("Soyad")
                        .font(.headline)
                    TextField("Soyadınız", text: $registerViewModel.lastName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    Text("E-posta")
                        .font(.headline)
                    TextField("E-posta adresiniz", text: $registerViewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    Text("Şifre")
                        .font(.headline)
                    SecureField("Şifreniz", text: $registerViewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        registerViewModel.register()
                    }) {
                        Text("Kayıt Ol")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .alert(isPresented: $registerViewModel.isRegistered) {
                        Alert(title: Text("Kayıt Başarılı"), message: Text("Kayıt işlemi başarıyla tamamlandı."), dismissButton: .default(Text("Tamam")))
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Hata"), message: Text(registerViewModel.errorMessage), dismissButton: .default(Text("Tamam")))
                    }
                }
                .padding()
            }
        }
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
