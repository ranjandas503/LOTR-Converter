//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Shanti Ranjan Das on 24/12/24.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismissSelectCurrency
    @Binding var fromCurrency: Currency
    @Binding var toCurrency: Currency
    
    
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the cuerency you are starting with:")
                    .fontWeight(.bold)
                
                CoinSelectionGrid(currency: $fromCurrency)
                
                Text("Select the cuerency you would like to convert to:")
                    .fontWeight(.bold)
                
                CoinSelectionGrid(currency: $toCurrency)
                
                Button("Done") {
                    dismissSelectCurrency()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var fromCurrency: Currency = .copperPenny
    @Previewable @State var toCurrency: Currency = .goldPenny
    SelectCurrency(fromCurrency: $fromCurrency, toCurrency: $toCurrency)
}
