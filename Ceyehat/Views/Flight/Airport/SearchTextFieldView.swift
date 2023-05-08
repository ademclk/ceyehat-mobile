//
//  SearchTextFieldView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 8.05.2023.
//

import SwiftUI

/// A custom TextField view for searching airports.
///
/// - Parameters:
///   - searchTerm: A two-way binding for the search term entered by the user.
///   - viewModel: The view model responsible for handling airport search logic.
struct SearchTextFieldView: View {
    @Binding var searchTerm: String
    @ObservedObject var viewModel: AirportViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField("Havalimanı ara", text: $searchTerm)
                .padding(.vertical)
                .padding(.leading, 8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: searchTerm) { searchTerm in
                    viewModel.searchAirport(searchTerm: searchTerm.lowercased(with: Locale(identifier: "tr")))
                }
            
            if !searchTerm.isEmpty {
                Button(action: {
                    searchTerm = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
        .padding(.horizontal)
    }
}


struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AirportViewModel()
        let searchTerm = State(initialValue: "")
        SearchTextFieldView(searchTerm: searchTerm.projectedValue, viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
