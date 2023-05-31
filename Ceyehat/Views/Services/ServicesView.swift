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
                    ForEach(services, id: \.name) { service in
                        ServiceRowView(service: service)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Hizmetler")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}

