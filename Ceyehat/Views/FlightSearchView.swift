//
//  FlightSearchView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 7.05.2023.
//

import SwiftUI

struct FlightSearchView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Flight Search")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // TODO: Implement the view
                
            }
            .navigationTitle("Bilet al")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView()
    }
}
