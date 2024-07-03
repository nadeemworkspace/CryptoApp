//
//  HomeView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 19/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false
    
    var body: some View {
        ZStack{
                
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(viewModel)
                })
            
            VStack {
                //Main Header
                homeHeader
                
                //Stats
                CoinStatRowView(showPortfolio: $showPortfolio)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width)
                
                //Search Bar
                SearchBarView(text: $viewModel.searchText)
                    .padding()
                
                //List
                listHeader
                
                //All Coin list
                if !showPortfolio {
                    allCoinList
                        .transition(.move(edge: .leading))
                }
                
                //Portfolio List
                if showPortfolio {
                    portfolioList
                        .transition(.move(edge: .trailing))
                }

                Spacer(minLength: 0)
            }
            
        } // Zstack
    }
}

extension HomeView {
    
    private var homeHeader: some View{
        HStack{
            CircleButton(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .onTapGesture {
                    if showPortfolio{
                        showPortfolioView.toggle()
                    }
                }
            Spacer()
            Text(showPortfolio ? "Your Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButton(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var listHeader: some View{
        HStack{
            Text("Coins")
            Spacer()
            if showPortfolio{
                Text("Portfolio")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondary)
        .padding(.horizontal)
        .padding(.top, 6)
    }
    
    private var allCoinList: some View{
        List{
            ForEach(viewModel.allCoins){ coin in
                CoinRowView(coin: coin, showHoldings: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
        
    }
    
    private var portfolioList: some View{
        List{
            ForEach(viewModel.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldings: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
}

struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            HomeView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(dev.homeViewModel)
    }
}
