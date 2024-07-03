//
//  CircleButton.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 19/05/24.
//

import SwiftUI

struct CircleButton: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.23),
                radius: 10, x: 0, y: 0)
    }
}

struct CircleButton_Preview: PreviewProvider{
    static var previews: some View{
        
        Group {
            CircleButton(iconName: "heart.fill")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            CircleButton(iconName: "pencil")
                .previewLayout(.sizeThatFits)
        }

    }
}
