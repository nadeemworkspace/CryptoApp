//
//  CoinStatRowView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 22/05/24.
//

import SwiftUI

struct CoinStatRowView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack{
            ForEach(viewModel.stats) { stats in
                StatisticsContainerView(stats: stats)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct CoinStatRowView_Previews: PreviewProvider{
    static var previews: some View{
        CoinStatRowView(showPortfolio: .constant(true))
            .previewLayout(.sizeThatFits)
            .environmentObject(dev.homeViewModel)
    }
}
