//
//  FMFinderCategoryCell.swift
//  iOSFileManager
//
//  Created by Saurav Nagpal on 28/10/24.
//

import SwiftUI

struct FMFinderCategoryCell: View {
    let cellModel: FMFinderCategoryListCellModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(cellModel.header)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(cellModel.categories, id: \.self.id) { category in
                        categoryCell(category: category).frame(width: 80, height: 80)
                    }
                }.background(.clear)
            }.background(.clear)
        }.frame(height: 100).background(.clear)
    }
    
    @ViewBuilder
    fileprivate func categoryCell(category: FMFinderCategory) -> some View {
        VStack(alignment: .center) {
            if let icon = category.icon {
                Image(icon)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(5)
            }
        }
        .cardStyle(fillColor: Color("primaryBackgroundColor"))
    }
    
    @ViewBuilder
    fileprivate func categoryTitle(category: FMFinderCategory) -> some View {
        
    }
    
}

