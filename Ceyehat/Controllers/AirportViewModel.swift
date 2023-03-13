//
//  AirportViewModel.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 13.03.2023.
//

import Foundation

class AirportViewModel: ObservableObject {
    @Published var airports: [Airport] = []
    
    func getAirports() {
        guard let url = URL(string: Api.BASE_URL + Api.GET_AIRPORTS) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let airports = try JSONDecoder().decode([Airport].self, from: data)
                DispatchQueue.main.async {
                    self?.airports = airports
                }
                
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
