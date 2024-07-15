//
//  NoticePreviewContentDependency.swift
//  FileManager
//
//  Created by Saurav Nagpal on 07/01/24.
//

import Foundation

class ScannerPreviewDependency {
    let previewDepdendency = AppPreviewDependency()
    let appNavigationState = FMAppNavigationState()
    
    func scannerViewModel() -> FMScannerViewModel {
        return FMScannerViewModel(scannerDependencies: self.scannerDependencies())
    }
    
    func scannerDependencies() -> FMScannerDependencies {
        return DefaultFMScannerDependencies(dependencies: previewDepdendency)
    }
    
    func scannerCoordinater() -> FMScannerCoordinator {
        return FMScannerCoordinator(dependencies: previewDepdendency, appNavigationState: appNavigationState)
    }

}
