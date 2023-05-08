//
//  SeatButton.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 29.03.2023.
//

import SwiftUI

struct SeatButton: View {
    let seat: Seat
    let action: () -> Void
    let occupiedColor: Color = .red
    let selectedColor: Color = .blue
    let availableColor: Color = .green
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 5)
                .fill(seatColor)
                .frame(width: 50, height: 50)
                .overlay(
                    Text(seat.seatNumber)
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                )
        }
        .disabled(!isSeatAvailable)
        .buttonStyle(PlainButtonStyle())
    }
    
    private var isSeatAvailable: Bool {
        return seat.seatStatus != 2
    }
    
    private var seatColor: Color {
        switch seat.seatStatus {
        case 0:
            return availableColor
        case 1:
            return selectedColor
        case 2:
            return occupiedColor
        default:
            return selectedColor
        }
    }
}

struct SeatButton_Previews: PreviewProvider {
    static var seat = Seat(seatNumber: "1A", seatClass: 2, seatStatus: 2)
    static var previews: some View {
        SeatButton(seat: seat, action: {})
    }
}
