//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 23/05/24.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(text: $viewModel.searchText)
                        .padding(.all)
                    
                    ScrollView {
                        ForEach(0...100, id: \.self) { _ in
                            Text("Text")
                        }
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    XmarkCloseView()
                }
            }
        }
    }
}

struct HPortfolioView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            PortfolioView()
                .preferredColorScheme(.light)
                .navigationBarTitleDisplayMode(.large)
        }
        .environmentObject(dev.homeViewModel)
    }
}
