//
//  LoginViewModel.swift
//  FileManager
//
//  Created by Saurav Nagpal on 06/03/24.
//

import Foundation
import Combine

class FMSettingViewModel: FMViewModel {
    // MARK: - Ivar.
    @Published var username: String = ""
    @Published var password: String = ""
    let dependencies: FMSettingDependencies
    fileprivate var loginStore = Set<AnyCancellable>()
    
    // MARK: - Life cycle.
    init(dependencies: FMSettingDependencies) {
        self.dependencies = dependencies
        self.addThemeObserver()
    }
    
    func apply(theme: FMTheme) {
        self.objectWillChange.send()
    }
}
