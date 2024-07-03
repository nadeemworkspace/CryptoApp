//
//  StatisticsModel.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 22/05/24.
//

import Foundation

struct StatisticsModel: Identifiable{
    let id: UUID = UUID()
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
