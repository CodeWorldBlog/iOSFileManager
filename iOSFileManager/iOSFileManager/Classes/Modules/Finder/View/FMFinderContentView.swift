//
//  ContentView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 09/03/23.
//

import SwiftUI
import CoreData

struct FMFinderContentView: View {
    @ObservedObject var viewModel: FMFinderContentViewModel
    
    init(dependencies: FMFinderDependencies) {
        self.viewModel = dependencies.resolveFinderContentViewModel()
    }
    
    var body: some View {
        List {
            if let categories = self.viewModel.categories {
                FMFinderCategoryCell(cellModel: categories).listRowSeparator(.hidden)
            }
            
            if let folders = self.viewModel.folders {
                FMFinderFolderCell(cellModel: folders).listRowSeparator(.hidden)
            }
            
            Section(header: Text("Recently")) {
                if let recentFiles = self.viewModel.recentFiles {
                    ForEach(recentFiles, id: \.self.id) { file in
                        FMFinderRecentFileCell(cellModel: file).listRowSeparator(.hidden)
                    }
                } else {
                    noRecentFileCell().listRowSeparator(.hidden).frame(height: 60)
                }
            }
            
        }.listRowBackground(Color.clear).listStyle(.plain).listRowSeparator(.hidden)
    }
    
    @ViewBuilder
    fileprivate func cell(forDocument document: FMFinderDocument) -> some View {
        Text(document.title)
    }
    
    @ViewBuilder
    fileprivate func noRecentFileCell() -> some View {
        Text(FinderLocalization.noRecentDocumentMsg)
    }
}

struct MFeedContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dependencies = FinderPreviewDependency().finderDependencies()
        FMFinderContentView(dependencies: dependencies)
    }
}
