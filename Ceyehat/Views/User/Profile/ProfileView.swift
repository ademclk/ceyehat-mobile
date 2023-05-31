//
//  ProfileView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 26.04.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userAuth: UserAuth
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        let name = userAuth.user?.firstName ?? "Kullanıcı"
        
        if userAuth.isAuthenticated {
            NavigationView {
                Form {
                    Section(header: Text("Profilim")) {
                        Text("Hoş geldin, \(name)!")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical, 20)
                    }
                    .textCase(.none)
                    
                    Section(header: Text("Ayarlar")) {
                        NavigationLink(destination: AccountSettingsView()) {
                            Text("Hesap")
                        }
                        NavigationLink(destination: PrivacySettingsView()) {
                            Text("Gizlilik")
                        }
                        NavigationLink(destination: NotificationSettingsView()) {
                            Text("Bildirim")
                        }
                        NavigationLink(destination: TravelPreferencesView()) {
                            Text("Seyahat Tercihleri")
                        }
                        NavigationLink(destination: SecuritySettingsView()) {
                            Text("Güvenlik")
                        }
                        NavigationLink(destination: PaymentSettingsView()) {
                            Text("Ödeme Yöntemleri")
                        }
                        Toggle("Koyu mod", isOn: $isDarkModeEnabled)
                    }
                    .textCase(.none)
                    
                    Section {
                        Button(action: {
                            userAuth.logout()
                        }) {
                            Text("Çıkış yap")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                    .textCase(.none)
                }
                .navigationTitle("Profil")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(GroupedListStyle())
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
            }
        } else {
            LoginView(userAuth: userAuth)
                .environmentObject(userAuth)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserAuth())
    }
}
