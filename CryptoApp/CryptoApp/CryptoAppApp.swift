//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 19/05/24.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
