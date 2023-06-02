//
//  PrivacySettingsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 24.05.2023.
//

import SwiftUI

struct PrivacySettingsView: View {
    @EnvironmentObject var activityController: ActivityController
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
            
            Section(header: Text("Kullanıcı Etkinliği")) {
                List(activityController.fetchActivities(), id: \.id) { activity in
                    VStack(alignment: .leading) {
                        Text(activity.action ?? "")
                        Text("\(activity.timestamp ?? Date(), formatter: privacyDateFormatter)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .textCase(.none)            
        }
        .navigationTitle("Privacy Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

let privacyDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .long
    return formatter
}()

struct PrivacySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let userActivity = ActivityController()
        
        PrivacySettingsView()
            .environmentObject(userActivity)
    }
}
