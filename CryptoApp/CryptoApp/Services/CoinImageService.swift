//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 20/05/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService{
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.shared
    private let imageName: String
    private let folderName: String = "coin_images"
    
    init(coin: CoinModel){
        self.coin = coin
        self.imageName = coin.id
        self.getCoinImage()
    }
    
    private func getCoinImage(){
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName){
            self.image = savedImage
        }else{
            downloadCoinImage(url: coin.image)
        }
    }
    
    private func downloadCoinImage(url: String){
        guard let url = URL(string: url) else { return }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap{ (data) -> UIImage? in
                return UIImage(data: data)
            }
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] image in
                guard let self = self, let image else { return }
                self.image = image
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: image, imageName: imageName, folderName: folderName)
            })
    }
    
}
