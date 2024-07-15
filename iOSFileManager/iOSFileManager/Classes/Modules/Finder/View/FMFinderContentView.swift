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
        }
    }
}

struct MFeedContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dependencies = FinderPreviewDependency().finderDependencies()
        FMFinderContentView(dependencies: dependencies)
    }
}
