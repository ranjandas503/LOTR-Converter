//
//  Currency.swift
//  LOTRConverter
//
//  Created by Shanti Ranjan Das on 25/12/24.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    // from identifyable and case iterable 
    var id: Currency { self }
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: ImageResource {
        switch self {
        case .copperPenny: .copperpenny
        case .silverPenny: .silverpenny
        case .silverPiece: .silverpiece
        case .goldPenny: .goldpenny
        case .goldPiece: .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny: "Copper Penny"
        case .silverPenny: "Silver Penny"
        case .silverPiece: "Silver Piece"
        case .goldPenny: "Gold Penny"
        case .goldPiece: "Gold Piece"
        }
    }
    
    func convertTo(_ amount: String, to currency: Currency) -> String {
        guard let amountDouble = Double(amount) else { return "" }
        let convertedAmount = (amountDouble / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}
