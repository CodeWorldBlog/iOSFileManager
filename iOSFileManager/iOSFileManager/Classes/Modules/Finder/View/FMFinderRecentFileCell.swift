//
//  FMFinderRecentFileCell.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 30/10/24.
//

import SwiftUI

struct FMFinderRecentFileCell: View {
    let cellModel: FMFinderRecentFileCellModel
    
    var body: some View {
        HStack(alignment: .center) {
            if let icon = cellModel.icon {
                Image(icon)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(5)
            }
            Text(cellModel.title).padding(.leading, 8)
        }.frame(height: 60)
    }
}
