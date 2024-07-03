//
//  Color.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 19/05/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme{
    let accent = Color(.accent)
    let background = Color(.background)
    let green = Color(.customGreen)
    let red = Color(.customRed)
    let secondary = Color(.secondaryText)
}
