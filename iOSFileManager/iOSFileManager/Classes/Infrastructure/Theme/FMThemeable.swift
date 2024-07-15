//
//  ASThemeable.swift
//  SNContentApplication
//
//  Created by Saurav Nagpal on 30/03/23.
//

import Foundation

public protocol FMThemeable: AnyObject {
    func apply(theme: FMTheme)
}

extension FMThemeable {
    var themeProvider: FMDefaultThemeService {
        return FMDefaultThemeService.shared
    }
    
    var currentTheme: FMTheme {
        return themeProvider.theme
    }
}
