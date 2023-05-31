//
//  FoodServiceView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 18.05.2023.
//

import SwiftUI

struct FoodServiceView: View {
    @State private var searchText = ""
    @State private var showOnlyAvailable = false
    
    var filteredFoodServices: [FoodService] {
        sampleFoodServices
            .filter { service in
                (service.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (showOnlyAvailable ? service.isAvailable : true)
            }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Restoran adı girin...", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Toggle(isOn: $showOnlyAvailable) {
                    Text("Sadece açık restoranları göster")
                }
                .padding(.horizontal)
                
                List(filteredFoodServices) { service in
                    NavigationLink(destination: FoodServiceDetailView(service: service)) {
                        FoodServiceRowView(service: service)
                    }
                }
            }
            .navigationBarTitle("Yemek Servisi", displayMode: .inline)
        }
    }
}


struct FoodServiceView_Previews: PreviewProvider {
    static var previews: some View {
        FoodServiceView()
    }
}
