//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Shanti Ranjan Das on 26/12/24.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    var message: Text? = Text("Select your preferred currency by tapping on the currency icon")
    var image: Image? = Image("hand.tap.fill")
}
