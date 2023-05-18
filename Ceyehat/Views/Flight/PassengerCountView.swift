//
//  PassengerCountView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 17.05.2023.
//

import SwiftUI

struct PassengerCountView: View {
    @Binding var totalPassengerCount: Int
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Yolcular")
                .font(.headline)
            ForEach(PassengerType.allCases, id: \.self) { type in
                PassengerStepper(type: type, count: $totalPassengerCount)
            }
        }
        .padding(.vertical)
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
                Text(type.descriptionDetails)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Stepper(value: $count, in: 1...9) {
                Text("\(count)")
                    .foregroundColor(.black)
            }
            .labelsHidden()
            .accentColor(.blue)
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct PassengerCountView_Previews: PreviewProvider {
    static var previews: some View {
        PassengerCountView(totalPassengerCount: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
