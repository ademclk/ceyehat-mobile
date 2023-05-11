//
//  Cards.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 10.05.2023.
//

import Foundation
import SwiftUI

func attractionCard(attraction: Destination) -> some View {
    VStack {
        Image(systemName: "map")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
        
        Text(attraction.name)
            .fontWeight(.semibold)
    }
}

func itineraryCard(itinerary: Destination) -> some View {
    VStack {
        Image(systemName: "calendar")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
        
        Text(itinerary.name)
            .fontWeight(.semibold)
    }
}

func categoryCard(category: Category) -> some View {
    VStack {
        Image(systemName: category.iconName)
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)
        
        Text(category.name)
            .fontWeight(.semibold)
    }
}
