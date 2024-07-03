//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 20/05/24.
//

import SwiftUI

//BODY
struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldings: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            leftColumn
            
            Spacer()
            
            if showHoldings{ holdingsColomn }
            
            rateColumn
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
        }
        .font(.subheadline)
    }
}

//COMPONENTS
extension CoinRowView {
    
    //Left
    private var leftColumn: some View{
        HStack{
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondary)
                .frame(minWidth: 30)
            
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    //Center
    private var holdingsColomn: some View{
        VStack(alignment: .trailing){
            Text(coin.currentHolding.asCurrencyString2Decimals())
                .bold()
            HStack(spacing: 5){
                Text((coin.currentHoldings ?? 0)?.asNumberString() ?? "")
                Text(coin.symbol.uppercased())
            }

        }
        .foregroundColor(Color.theme.accent)
    }
    
    //Right
    private var rateColumn: some View {
        VStack(alignment: .trailing){
            Text("\(coin.currentPrice.asCurrencyString())")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
                )
        }
    }
    
}

struct CoinRowView_Preview: PreviewProvider{
    static var previews: some View{
        CoinRowView(coin: dev.coin, showHoldings: true)
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
    }
}
