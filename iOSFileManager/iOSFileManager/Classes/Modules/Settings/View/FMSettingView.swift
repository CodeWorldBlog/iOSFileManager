//
//  MLoginView.swift
//  FileManager
//
//  Created by Saurav Nagpal on 06/03/24.
//

import SwiftUI

struct FMSettingView: View {
    @StateObject var viewModel: FMSettingViewModel
    
    var theme: FMTheme {
        return self.viewModel.currentTheme
    }
    
    var body: some View {
        List {
            
        }
        .padding(30).background(theme.appColorPalette.appBackgroundColor).navigationTitle(GeneralTextLocalization.navTitle)
    }

}

