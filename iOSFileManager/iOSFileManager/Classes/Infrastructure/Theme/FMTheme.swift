//
//  File.swift
//  Awakening Stories
//
//  Created by Saurav Nagpal on 31/01/23.
//

import Foundation

public enum SupportedTheme {
    case light
    case dark
    case adaptive
}

public struct FMTheme  {
    //MARK: - IVar
    public var type: SupportedTheme
    public var appColorPalette: FMColorPalette
    
    init(type: SupportedTheme, colors: FMColorPalette) {
        self.type = type
        self.appColorPalette = colors
    }
}
