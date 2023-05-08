//
//  LoginView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 27.04.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Giriş Yap")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            VStack {
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(.thickMaterial)
                    .cornerRadius(10)
            }
            
        
            Spacer()
        }
        .padding()
        .background(.red.opacity(0.8))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
