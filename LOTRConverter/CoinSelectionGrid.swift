//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Shanti Ranjan Das on 24/12/24.
//

import SwiftUI

struct CoinSelectionGrid: View {
    
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                let currencyView = CreateCurrencyView(icon: currency.image, name: currency.name)
                if (self.currency == currency) {
                    currencyView
                        .shadow(color: .black, radius: 10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    currencyView.onTapGesture {
                        self.currency = currency
                    }
                }
            }
        }
    }
    
    func CreateCurrencyView(icon: ImageResource, name: String) -> some View {
        return ZStack(alignment: .bottom) {
            Image(icon)
                .resizable()
                .scaledToFit()
            
            Text(name)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }.padding(3)
            .frame(width: 100, height: 100)
            .background(.brown)
            .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    @Previewable @State var currency: Currency = .copperPenny
    CoinSelectionGrid(currency: $currency)
}
