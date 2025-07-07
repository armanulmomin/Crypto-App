//
//  HomeView.swift
//  Crypto App
//
//  Created by Arman on 2/7/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @EnvironmentObject private var vm: HomeViewModel
    var body: some View {
        ZStack{
            //background color
            Color.theme.background.ignoresSafeArea()
            
            //content layer
            VStack{
                homeHeader
                columnTiles
                if !showPortfolio{
                    allCoinList
                    .transition(.move(edge: .leading))
                }
                
                if showPortfolio{
                    portfolioCoinList
                        .transition(.move(edge: .trailing))
                        
                }

                
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView{
        HomeView().navigationBarHidden(true)
    }
    .environmentObject(DeveloperPreview.instance.homeVM)
   
}

extension HomeView{
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinList: some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    
                
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinList: some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    
                
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTiles: some View {
        HStack{
            Text("Coins")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
