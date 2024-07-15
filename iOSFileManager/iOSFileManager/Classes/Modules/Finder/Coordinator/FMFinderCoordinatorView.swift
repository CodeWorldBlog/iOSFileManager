//
//  MyFeedCoordinatorView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 26/04/23.
//

import SwiftUI

struct FMFinderCoordinatorView: View, FMTabChildView {
    @StateObject var coordinator: FMFinderCoordinator
    
    var tabItem: FMTabItem {
        return FMTabItem(tabName: .finder)
    }

    var body: some View {
        NavigationStack {
          
        }
    }
}


struct MFeedCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        let dependency = FinderPreviewDependency()
        FMFinderCoordinatorView(coordinator: dependency.finderCoordinater())
    }
}

