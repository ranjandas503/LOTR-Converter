//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Shanti Ranjan Das on 24/12/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo: Bool = false
    @State var showCurrency: Bool = false
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @State var fromCurrency: Currency = Currency.silverPenny
    @State var toCurrency: Currency = Currency.goldPiece
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        HStack {
                            Image(fromCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(fromCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.onTapGesture {
                            showCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.leading)
                            .focused($leftTyping)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Image(toCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(toCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.onTapGesture {
                            showCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                        
                    }
                }.padding().background(.black.opacity(0.5)).clipShape(.capsule).keyboardType(.decimalPad)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            .task {
                try? Tips.configure()
            }
            .onChange(of: leftAmount){
                if leftTyping && !leftAmount.isEmpty {
                    rightAmount = fromCurrency.convertTo(leftAmount, to: toCurrency)
                }
            }
            .onChange(of: rightAmount) {
                if rightTyping && !rightAmount.isEmpty{
                    leftAmount = toCurrency.convertTo(rightAmount, to: fromCurrency)
                }
            }
            .onChange(of: fromCurrency) {
                leftAmount = toCurrency.convertTo(rightAmount, to: fromCurrency)
            }
            .onChange(of: toCurrency) {
                rightAmount = fromCurrency.convertTo(leftAmount, to: toCurrency)
            }
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
            .sheet(isPresented: $showCurrency) {
                SelectCurrency(fromCurrency: $fromCurrency, toCurrency: $toCurrency)
            }
        }
    }
}

#Preview {
    ContentView()
}
