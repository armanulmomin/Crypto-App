//
//  CoinRowView.swift
//  Crypto App
//
//  Created by Arman on 4/7/25.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    var body: some View {
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
            Spacer()
            VStack{
                Text("\(coin.currentPrice)")
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                
                
            }
        }
    }
}

#Preview {
    
    CoinRowView(coin: DeveloperPreview.instance.coin)
    
    
}
