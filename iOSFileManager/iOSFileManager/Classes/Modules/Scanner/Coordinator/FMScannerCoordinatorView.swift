//
//  MAddFeedCoordinatorView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 22/05/23.
//

import SwiftUI

struct FMScannerCoordinatorView: View, FMTabChildView {
    @ObservedObject var coordinator: FMScannerCoordinator
    var tabItem: FMTabItem {
        return FMTabItem(tabName: .scanner)
    }
    
    var body: some View {
        NavigationView {
            FMScannerView(dependencies: coordinator.addFeedDependencies)
        }
    }
}


