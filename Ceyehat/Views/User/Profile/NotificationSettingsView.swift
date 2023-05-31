//
//  NotificationSettingsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 24.05.2023.
//

import SwiftUI

struct NotificationSettingsView: View {
    @State private var isNotificationsEnabled = false
    @State private var isPromotionNotificationsEnabled = false
    @State private var isTripNotificationsEnabled = false
    
    var body: some View {
        Form {
            Section(header: Text("Bildirim Ayarları")) {
                Toggle("Bildirimleri Etkinleştir", isOn: $isNotificationsEnabled)
                
                Toggle("Promosyon Bildirimleri", isOn: $isPromotionNotificationsEnabled)
                    .disabled(!isNotificationsEnabled)
                
                Toggle("Seyahat Bildirimleri", isOn: $isTripNotificationsEnabled)
                    .disabled(!isNotificationsEnabled)
            }
            .textCase(.none)
        }
        .navigationTitle("Bildirimler")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct NotificationSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSettingsView()
    }
}
