//
//  FlightTypePicker.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 14.05.2023.
//

import SwiftUI

struct FlightTypePicker: View {
    @Binding var selection: FlightType
    private var data: [FlightType]

    init(
        _ data: [FlightType] = FlightType.allCases,
        selection: Binding<FlightType>
    ) {
        self.data = data
        _selection = selection
    }
    
    var body: some View {
        Picker(selection: $selection) {
            ForEach(data) { type in
                Text(type.title)
                    .tag(type)
            }
        } label: {
            Label("Uçuş Tipi", systemImage: selection.systemImage)
        }
        .pickerStyle(.segmented)
    }
}

struct FlightTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        FlightTypePicker(selection: .constant(.multiCity))
    }
}
