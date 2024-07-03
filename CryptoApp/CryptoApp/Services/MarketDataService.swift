//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 23/05/24.
//

import Foundation
import Combine

class MarketDataService{
    
    @Published var market: MarketDataModel? = nil
    var marketSubscription: AnyCancellable?
    
    init(){
        getMarketData()
    }
    
    private func getMarketData(){
        guard let url = URL(string: Constants.marketURL) else { return }
        marketSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] globalData in
                self?.market = globalData.data
                self?.marketSubscription?.cancel()
            })
    }
    
}
