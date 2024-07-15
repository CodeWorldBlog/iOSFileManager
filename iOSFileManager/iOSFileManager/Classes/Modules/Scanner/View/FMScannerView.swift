//
//  AddFeedView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 22/05/23.
//

import SwiftUI
import PhotosUI
import iOSLoader

struct FMScannerView: View {
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
fileprivate extension FMScannerView {
    func bindViewModel() {
        
    }

}

struct AddFeedView_Previews: PreviewProvider {
    static var previews: some View {
        let dependencies = ScannerPreviewDependency()
        FMScannerView(dependencies: dependencies.scannerDependencies())
    }
}
