//
//  FMDocumentView.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 25/11/24.
//

import SwiftUI
import PhotosUI
import iOSLoader

struct FMDocumentView: View {
    @ObservedObject var viewModel: FMScannerViewModel
    
    init(dependencies: FMScannerDependencies) {
        self.viewModel = dependencies.resolveScannerViewModel()
    }
    
    var body: some View {
        Form {
        }
    }
    
}

//MARK: - View Model Binding
fileprivate extension FMDocumentView {
    func bindViewModel() {
        
    }

}

struct FMDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        let dependencies = ScannerPreviewDependency()
        FMScannerView(dependencies: dependencies.scannerDependencies())
    }
}
