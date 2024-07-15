//
//  ThemeService.swift
//  ServiceApp
//
//  Created by Saurav Nagpal on 16/12/22.
//

import Foundation

public class FMDefaultThemeService {
    static let shared = FMDefaultThemeService()
    fileprivate var defaultTheme: FMTheme!
    fileprivate var applicationTheme: ApplicationTheme!
    
    struct ApplicationTheme {
        //MARK: - Instance
        let light: FMTheme
        let dark: FMTheme
    }
    
    public var theme: FMTheme! {
        didSet {
            notifyObservers()
        }
    }

    private init() {
        let defaultColorPalette = self.defaultColorPalette()
        self.defaultTheme = FMTheme(type: .light, colors: defaultColorPalette)
        self.theme = self.defaultTheme
    }
    
    func setupSupportedTheme(themes: ApplicationTheme) {
        self.applicationTheme = themes
    }

    public func register<Observer: FMThemeable>(observer: Observer) {
        observer.apply(theme: self.theme)
        self.observers.add(observer)
    }

    private var observers: NSHashTable<AnyObject> = NSHashTable.weakObjects()

    public func toggleTheme(theme: FMTheme) {
        self.theme = theme
    }

    private func notifyObservers() {
        DispatchQueue.main.async {
            self.observers.allObjects
                .compactMap({ $0 as? FMThemeable })
                .forEach({ $0.apply(theme: self.theme) })
        }
    }
    
    private func defaultColorPalette() -> FMColorPalette {
        //TODO
        let responseData = Data.dictionaryDataFromBundlePlist(filename: "DefaultTheme")
        return try! JSONDecoder().decode(FMLightColorPalette.self, from: responseData!)
    }
}
