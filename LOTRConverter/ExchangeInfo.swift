//
//  ExchangeInfo.swift
//  LOTRConverter
//
//  Created by Shanti Ranjan Das on 24/12/24.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dismissExchangeInfo
    
    var body: some View {
        ZStack {
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
                    .font(.title3)
                    .padding()
                
                createMultiLines(leadingImage: .goldpiece, trailingImage: .goldpenny, title: "1 Gold Piece = 4 Gold Pennies")
                createMultiLines(leadingImage: .goldpenny, trailingImage: .silverpiece, title: "1 Gold Pennie = 4 Silver Pennies")
                createMultiLines(leadingImage: .silverpiece, trailingImage: .silverpenny, title: "1 Silver Piece = 4 Silver Pennies")
                createMultiLines(leadingImage: .silverpenny, trailingImage: .copperpenny, title: "1 Silver Pennie = 100 Copper Pennies")
                
                Button("Done") {
                    dismissExchangeInfo()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
            }.foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}

struct createMultiLines: View {
    let leadingImage: ImageResource
    let trailingImage: ImageResource
    let title: String
    
    var body: some View {
        HStack {
            Image(leadingImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(title)
            
            Image(trailingImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}
