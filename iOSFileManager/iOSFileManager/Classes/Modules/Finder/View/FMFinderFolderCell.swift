//
//  FMFinderFolderCell.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 21/10/24.
//

import SwiftUI

struct FMFinderFolderCell: View {
    let cellModel: FMFinderFolderListCellModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(cellModel.header)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(cellModel.folders, id: \.self.id) { folder in
                        folderItem(folder: folder).frame(width: 120, height: 120)
                    }
                }.background(.clear)
            }.background(.clear)
        }.frame(height: 180).background(.clear)
    }
    
    @ViewBuilder
    fileprivate func folderItem(folder: FMFinderDocument) -> some View {
        VStack(alignment: .center) {
            if let icon = folder.icon {
                Image(icon)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(5)
            }
            Spacer().frame(height: 20)
            Text(folder.title)
                .foregroundColor(.accentColor)
                .font(.caption)
        }
        .cardStyle(fillColor: Color("primaryBackgroundColor")).onTapGesture {
            self.cellModel.documentTapped(folder)
        }
    }
}

#Preview {

}
