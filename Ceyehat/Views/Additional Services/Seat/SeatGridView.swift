//
//  SeatGridView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 29.03.2023.
//

import SwiftUI

struct SeatGridView: View {
    let seats: [Seat]
    var seatSelected: ((Seat) -> Void)?
    
    let seatColumns = ["A", "B", "C", "D", "E", "F"]
    
    func rowContainsSeat(row: Int) -> Bool {
        return seats.contains { Int($0.seatNumber.dropLast())! == row + 1 }
    }
    
    var body: some View {
        VStack (alignment: .center, spacing: 2){
            let maxRows = seats.map { Int($0.seatNumber.dropLast())! }.max() ?? 0

            ForEach(0..<maxRows, id: \.self) { rowIndex in
                if rowContainsSeat(row: rowIndex) {
                    HStack(alignment: .center, spacing: 8) {
                        ForEach(seatColumns.prefix(3), id: \.self) { column in
                            if let seat = seats.first(where: { $0.seatNumber == "\(rowIndex+1)\(column)" }) {
                                SeatButton(seat: seat) {
                                    seatSelected?(seat)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.clear)
                                    .frame(width: 50, height: 50)
                            }
                        }
                        Spacer()
                        ForEach(seatColumns.suffix(3), id: \.self) { column in
                            if let seat = seats.first(where: { $0.seatNumber == "\(rowIndex+1)\(column)" }) {
                                SeatButton(seat: seat) {
                                    seatSelected?(seat)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.clear)
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .frame(minWidth: .leastNonzeroMagnitude)
    }
}

struct SeatGridView_Previews: PreviewProvider {
    static var seats = [Seat(seatNumber: "1A", seatClass: 0, seatStatus: 0),
                        Seat(seatNumber: "1B", seatClass: 1, seatStatus: 1),
                        Seat(seatNumber: "1C", seatClass: 1, seatStatus: 2),
                        Seat(seatNumber: "1D", seatClass: 1, seatStatus: 0),
                        Seat(seatNumber: "1E", seatClass: 1, seatStatus: 1),
                        Seat(seatNumber: "1F", seatClass: 1, seatStatus: 0),
                        Seat(seatNumber: "2B", seatClass: 1, seatStatus: 1),
                        Seat(seatNumber: "3B", seatClass: 1, seatStatus: 0)]
    
    static var previews: some View {
        SeatGridView(seats: seats)
    }
}
