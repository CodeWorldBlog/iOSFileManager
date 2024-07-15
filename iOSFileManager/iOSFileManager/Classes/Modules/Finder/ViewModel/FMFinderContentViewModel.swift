//
//  MFeedContentViewModel.swift
//  FileManager
//
//  Created by Saurav Nagpal on 27/04/23.
//

import Foundation
import Combine

class FMFinderContentViewModel: FMViewModel {
    // MARK: - iVar.
    let dependencies: FMFinderDependencies
    fileprivate var currentFeedPageIndex = 0
    let feedPageSize = 50
    fileprivate var store = Set<AnyCancellable>()
    
    
    //MARK: - Life Cycle
    init(dependencies: FMFinderDependencies) {
        self.dependencies = dependencies
        self.addThemeObserver()
    }
    
    func apply(theme: FMTheme) {
        
    }
}
