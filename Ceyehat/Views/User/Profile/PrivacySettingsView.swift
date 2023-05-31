//
//  PrivacySettingsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 24.05.2023.
//

import SwiftUI

struct PrivacySettingsView: View {
    @State private var enableAnalytics = false
    @State private var enableLocation = false
    @State private var enableLocationTracking = false
    @State private var enablePersonalizedAds = false
    @State private var isAppPermissionsEnabled = false
    @State private var isDataSharingEnabled = false
    
    var body: some View {
        Form {
            Section(header: Text("Analiz")) {
                Toggle("Analizi etkinleştir", isOn: $enableAnalytics)
                Toggle("Uygulama izinleri", isOn: $isAppPermissionsEnabled)
                Toggle("Veri paylaşma tercihleri", isOn: $isDataSharingEnabled)
            }
            .textCase(.none)
            
            Section(header: Text("Konum")) {
                Toggle("Konum erişimini etkinleştir", isOn: $enableLocation)
                Toggle("Konum takibini etkinleştir", isOn: $enableLocationTracking)
            }
            .textCase(.none)
            
            Section(header: Text("Reklamlar")) {
                Toggle("Kişiselleştirilmiş reklamları etkinleştir", isOn: $enablePersonalizedAds)
            }
            .textCase(.none)
            
        }
        .navigationTitle("Privacy Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PrivacySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacySettingsView()
    }
}
