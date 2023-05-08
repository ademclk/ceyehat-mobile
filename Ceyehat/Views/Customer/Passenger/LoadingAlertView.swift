//
//  LoadingAlertView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 5.04.2023.
//

import SwiftUI

struct LoadingAlertView: View {
    var body: some View {
        HStack {
            ProgressView("Yolcu ekleniyor ...")
        }
    }
}

struct LoadingAlertView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAlertView()
    }
}
