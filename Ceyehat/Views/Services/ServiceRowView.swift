//
//  ServiceRowView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 15.05.2023.
//

import SwiftUI

struct ServiceRowView: View {
    var service: Service
    
    var body: some View {
        HStack {
            Image(systemName: service.imageName)
                .foregroundColor(service.color)
                .frame(width: 60, height: 60)
                .background(service.color.opacity(0.1))
                .cornerRadius(8)
            NavigationLink(destination: service.destination()) {
                VStack(alignment: .leading) {
                    Text(service.name).font(.headline)
                    Spacer()
                    Text(service.description).font(.subheadline)
                }
                .padding()
                .frame(height: 100)
            }
        }
    }
}

struct ServiceRowView_Previews: PreviewProvider {
    static var previews: some View {
        let service = Service(name: "Otel Rezervasyonu", description: "En iyi otellerde konaklayın", imageName: "bed.double.fill", color: .purple, destination: { AnyView(Text("Otel Details View")) })
        ServiceRowView(service: service)
    }
}

