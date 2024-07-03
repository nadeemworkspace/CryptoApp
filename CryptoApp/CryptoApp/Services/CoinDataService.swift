//
//  DataService.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 20/05/24.
//

import Foundation
import Combine

class CoinDataService{
    
    @Published var coins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init(){
        getAllCoins()
    }
    
    private func getAllCoins(){
        guard let url = URL(string: Constants.cryptoURL) else { return }
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] coins in
                self?.coins = coins
                self?.coinSubscription?.cancel()
            })
    }
    
}
