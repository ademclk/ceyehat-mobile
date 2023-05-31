//
//  SecuritySettingsView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 24.05.2023.
//

import SwiftUI

struct SecuritySettingsView: View {
    @State private var isMFAEnabled = false
    @State private var isMailVerificationEnabled = false
    @State private var isSMSVerificationEnabled = false
    var body: some View {
        Form {
            Section(header: Text("Doğrulama")) {
                Toggle("SMS ile doğrulama", isOn: $isSMSVerificationEnabled)
                Toggle("E-posta ile doğrulama", isOn: $isMailVerificationEnabled)
                Toggle("2 faktörlü doğrulama", isOn: $isMFAEnabled)
            }
            .textCase(.none)
        }
        .navigationTitle("Güvenlik")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct SecuritySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SecuritySettingsView()
    }
}
