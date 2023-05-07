//
//  CheckinView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import SwiftUI

struct CheckinView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Check-in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // TODO: Implement the view
                
            }
            .navigationTitle("Check-in")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CheckinView_Previews: PreviewProvider {
    static var previews: some View {
        CheckinView()
    }
}
