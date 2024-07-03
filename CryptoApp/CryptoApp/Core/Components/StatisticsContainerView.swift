//
//  StatisticsContainerView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 22/05/24.
//

import SwiftUI

struct StatisticsContainerView: View {
    
    let stats: StatisticsModel
    
    var body: some View {
        VStack{
            Text(stats.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondary)
            Text(stats.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack(spacing: 4){
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stats.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(stats.percentageChange?.asPercentageString() ?? "")
            }
            .foregroundColor((stats.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stats.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticsContainerView_Previews: PreviewProvider{
    static var previews: some View{
        StatisticsContainerView(stats: dev.stat1)
            .preferredColorScheme(.dark)
    }
}
