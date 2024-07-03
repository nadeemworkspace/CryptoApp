//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 20/05/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var stats: [StatisticsModel] = []
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    private func addSubscribers(){
//        service.$coins.sink { [weak self] coins in
//            self?.allCoins = coins
//        }
//        .store(in: &cancellable)
        
        $searchText
            .combineLatest(coinDataService.$coins) //Combine 2 subscribers together
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] filteredCoins in
                self?.allCoins = filteredCoins
            }
            .store(in: &cancellable)
        
        marketDataService.$market
            .map(mapMarketData)
            .sink { [weak self] statsArray in
                self?.stats = statsArray
            }
            .store(in: &cancellable)
    }
    
    //Filter
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel]{
        guard !text.isEmpty else { return coins }
        return coins.filter{ $0.name.lowercased().contains(text.lowercased()) ||
            $0.symbol.lowercased().contains(text.lowercased()) ||
            $0.id.lowercased().contains(text.lowercased()) }
    }
    
    private func mapMarketData(marketDataModel: MarketDataModel?) -> [StatisticsModel]{
        var statsArray: [StatisticsModel] = []
        guard let market = marketDataModel else { return statsArray }
        let marketCap = StatisticsModel(title: "Market Cap", value: market.marketCap, percentageChange: market.marketCapChangePercentage24HUsd)
        let volume = StatisticsModel(title: "24h Volume", value: market.volume)
        let btcDominance = StatisticsModel(title: "BTC Dominance", value: market.btcMarketPercentage)
        let portfolio = StatisticsModel(title: "Portfolio", value: "$0.00", percentageChange: 0)
        statsArray.append(contentsOf: [marketCap, volume, btcDominance, portfolio])
        return statsArray
    }
    
}
