//
//  MAddFeedDIContainer.swift
//  FileManager
//
//  Created by Saurav Nagpal on 24/05/23.
//

import Foundation

protocol FMScannerDependencies {
    func resolveScannerViewModel() -> FMScannerViewModel
}

final class DefaultFMScannerDependencies: FMScannerDependencies {
    private let dependencies: FMAppDependencies
    
    init(dependencies: FMAppDependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - ViewModel
    func resolveScannerViewModel() -> FMScannerViewModel {
        return FMScannerViewModel(scannerDependencies: self)
    }
}
