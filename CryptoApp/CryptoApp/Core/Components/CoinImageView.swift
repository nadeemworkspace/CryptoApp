//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 20/05/24.
//

import SwiftUI
import Combine

struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel
    
    init(coin: CoinModel){
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = viewModel.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if viewModel.isLoading{
                ProgressView()
            }else{
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondary)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider{
    static var previews: some View{
        CoinImageView(coin: dev.coin)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
