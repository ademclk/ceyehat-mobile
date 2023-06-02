//
//  ActionButtonView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 1.06.2023.
//

import SwiftUI

struct ActionButtonView<Destination: View>: View {
    var destination: Destination
    var icon: String
    var title: String
    var actionString: String
    
    @EnvironmentObject var activityController: ActivityController
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .padding(.trailing)
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .simultaneousGesture(TapGesture().onEnded{
            let context = activityController.container.viewContext
            activityController.addActivity(action: actionString, context: context)
        })
        .padding(.horizontal)
    }
}


struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(destination: Text("Destination View"), icon: "checkmark", title: "TEST", actionString: "fcf")
    }
}
