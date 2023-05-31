//
//  LoginView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 27.04.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var showingAlert: Bool = false
    @EnvironmentObject var userAuth: UserAuth
    @StateObject var loginViewModel: LoginViewModel
    
    init(userAuth: UserAuth) {
        _loginViewModel = StateObject(wrappedValue: LoginViewModel(userAuth: userAuth))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Giriş Yap")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("E-posta")
                        .font(.headline)
                    TextField("E-posta adresiniz", text: $loginViewModel.email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    Text("Şifre")
                        .font(.headline)
                    SecureField("Şifreniz", text: $loginViewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        loginViewModel.login()
                    }) {
                        Text("Giriş Yap")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Giriş Hatası"), message: Text("E-posta veya şifre yanlış."), dismissButton: .default(Text("Tamam")))
                    }
                }
                .padding()
                NavigationLink(destination: RegisterView()) {
                    Text("Hesabınız yok mu? Kayıt Ol")
                        .foregroundColor(.blue)
                }
                .padding(.top, 15)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let userAuth = UserAuth()
        LoginView(userAuth: userAuth)
            .environmentObject(userAuth)
    }
}

