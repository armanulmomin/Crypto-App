//
//  CoinRowView.swift
//  Crypto App
//
//  Created by Arman on 4/7/25.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn : Bool
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingsColumn{
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview {
    
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
    
    
}
extension CoinRowView{
    private var leftColumn : some View{
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30,height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading,6)
                .foregroundStyle(Color.theme.accent)
        }
    
    }
    
    private var centerColumn: some View{
        VStack{
            Text(coin.currentHoldingsValue.asCurrencyWithDecimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWithDecimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
                .bold()
            
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ?
                                 Color.theme.green : Color.theme.red)
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}



