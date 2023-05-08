//
//  ProfileView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 26.04.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profil")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(80)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
