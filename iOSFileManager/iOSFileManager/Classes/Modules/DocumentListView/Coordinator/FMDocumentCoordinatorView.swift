//
//  MAddFeedCoordinatorView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 22/05/23.
//

import SwiftUI

struct FMDocumentCoordinatorView: View, FMTabChildView {
    @ObservedObject var coordinator: FMDocumentCoordinator
    
    var tabItem: FMTabItem {
        return FMTabItem(tabName: .scanner)
    }
    
    var body: some View {
        NavigationView {
            FMScannerView(dependencies: coordinator.addFeedDependencies)
        }
    }
}


