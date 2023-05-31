//
//  TravelPreferencesView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 24.05.2023.
//

import SwiftUI

struct TravelPreferencesView: View {
    @State private var seatType = SeatType.Economy
    @State private var mealPreference = MealPreference.standard
    @State private var specialAssistance = false
    
    var body: some View {
        Form {
            Section(header: Text("Koltuk Tercihi")) {
                Picker("Koltuk Sınıfı", selection: $seatType) {
                    ForEach(SeatType.allCases, id: \.self) { seatType in
                        Text(seatType.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .textCase(.none)
            
            Section(header: Text("Özel Yardım")) {
                Toggle("Özel yardım ihtiyacı", isOn: $specialAssistance)
            }
            .textCase(.none)
        }
        .navigationTitle("Seyahat Tercihleri")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    enum SeatType: String, CaseIterable {
        case Economy
        case Comfort
        case Business
    }
    
    enum MealPreference: String, CaseIterable {
        case standard
        case vegetarian
        case vegan
        case glutenFree
        case kosher
    }
}


struct TravelPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        TravelPreferencesView()
    }
}
