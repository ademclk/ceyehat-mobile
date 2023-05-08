//
//  ServicesView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 26.04.2023.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                        NavigationLink(destination: Text("Otel")) {
                            Label("Book a Hotel", systemImage: "house.fill")
                        }
                        
                        NavigationLink(destination: Text("Araba")) {
                            Label("Rent a Car", systemImage: "car.fill")
                        }
                        
                        // Add more services here
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Hizmetler")
            }
        }
    }
}

struct MemoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}
