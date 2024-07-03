//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 20/05/24.
//

import Foundation
import Combine
import SwiftUI

class CoinImageViewModel: ObservableObject{
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    
    private let coin: CoinModel
    private let coinImageService: CoinImageService
    
    init(coin: CoinModel){
        self.coin = coin
        self.coinImageService = CoinImageService(coin: coin)
        addSubscribers()
        isLoading = true
    }
    
    private func addSubscribers(){
        coinImageService.$image.sink(receiveCompletion: { [weak self] _ in
            self?.isLoading = false
        }, receiveValue: { [weak self] image in
            self?.image = image
        })
        .store(in: &cancellables)
    }
    
}
