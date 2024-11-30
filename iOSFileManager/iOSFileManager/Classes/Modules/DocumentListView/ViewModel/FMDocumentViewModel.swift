//
//  AddFeedViewModel.swift
//  FileManager
//
//  Created by Saurav Nagpal on 22/05/23.
//

import Foundation
import Combine
import SwiftUI

class FMDocumentViewModel: FMViewModel {
    let documentDependencies: FMDocumentViewDependencies
    fileprivate var store = Set<AnyCancellable>()
    
    //MARK: - Life Cycle
    init(documentDependencies: FMDocumentViewDependencies) {
        self.documentDependencies = documentDependencies
        self.addThemeObserver()
    }
    
    func apply(theme: FMTheme) {
        
    }
}
