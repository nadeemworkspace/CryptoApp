//
//  SearchBarView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 21/05/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(text.isEmpty ? Color.theme.secondary : Color.theme.accent)
            
            TextField("Search by name or symbol...", text: $text)
                .foregroundColor(Color.theme.accent)
                .autocorrectionDisabled(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(text.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            text = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        
    }
}

struct SearchBarView_Previews: PreviewProvider{
    static var previews: some View{
        Group{
            SearchBarView(text: .constant(""))
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }

    }
}
