//
//  PassengerCountView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 17.05.2023.
//

import SwiftUI

struct PassengerCountView: View {
    @Binding var totalPassengerCount: Int
    @State private var passengerCounts: [PassengerType: Int] = [:]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Yolcular")
                .font(.headline)
                .foregroundColor(.primary)
            Text("Toplam Yolcu Sayısı: \(totalPassengerCount)")
                .font(.subheadline)
                .foregroundColor(.gray)
            ForEach(PassengerType.allCases, id: \.self) { type in
                PassengerStepper(type: type, count: binding(for: type))
                    .cornerRadius(10)
            }
        }
        .padding(.vertical)
        .onChange(of: passengerCounts) { _ in
            updateTotalPassengerCount()
        }
        .onAppear {
            initializePassengerCounts()
            updateTotalPassengerCount()
        }
    }
    
    private func binding(for type: PassengerType) -> Binding<Int> {
        Binding<Int>(
            get: { passengerCounts[type, default: 0] },
            set: { newValue in
                passengerCounts[type] = newValue
                updateTotalPassengerCount()
            }
        )
    }
    
    private func initializePassengerCounts() {
        for type in PassengerType.allCases {
            passengerCounts[type] = 0
        }
    }
    
    private func updateTotalPassengerCount() {
        totalPassengerCount = passengerCounts.values.reduce(0, +)
    }
}

struct PassengerStepper: View {
    var type: PassengerType
    @Binding var count: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(type.description)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("\(type.rawValue) Yolcu: \(count)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Stepper(value: $count, in: 0...9) {
                Text("\(count)")
                    .foregroundColor(.primary)
            }
            .labelsHidden()
            .accentColor(.blue)
        }
    }
}

struct PassengerCountView_Previews: PreviewProvider {
    static var previews: some View {
        PassengerCountView(totalPassengerCount: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
    }
}


