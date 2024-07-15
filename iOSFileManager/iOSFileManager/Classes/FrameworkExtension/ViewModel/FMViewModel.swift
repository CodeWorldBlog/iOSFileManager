//
//  FMViewModel.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/06/24.
//

import Foundation

protocol FMViewModel: FMThemeable, ObservableObject {
    func addThemeObserver()
}

extension FMViewModel {
    func addThemeObserver() {
        themeProvider.register(observer: self)
    }
}
