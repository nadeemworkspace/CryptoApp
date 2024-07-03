//
//  XmarkCloseView.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 23/05/24.
//

import SwiftUI

struct XmarkCloseView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .foregroundColor(Color.theme.accent)
        })
    }
}

#Preview {
    XmarkCloseView()
}
