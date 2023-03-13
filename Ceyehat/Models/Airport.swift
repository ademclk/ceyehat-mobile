//
//  Airport.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import Foundation

struct Airport: Hashable, Codable {
    let name: String
    let iataCode: String
    let cityName: String
    let countryName: String
}
